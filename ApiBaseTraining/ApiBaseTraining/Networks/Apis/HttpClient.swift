//  HttpClient.swift
//  ApiBaseTraining

import Foundation

class HttpClient {

    private enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }

    /// Header
    /// - contentType: Content-Type
    private enum HeaderField: String {
        case contentType = "Content-Type"
    }

    /// Content-Type
    /// - json: JSON
    private enum ContentType: String {
        case json = "application/json; charset=UTF-8"
    }

    // MARK: Properties

    // MARK: Public Methods

    /// GETメソッドを実行する
    /// - Parameters:
    ///   - urlString: URL文字列
    ///   - queries: クエリ
    /// - Returns: レスポンスボディ
    public static func get(urlString: String, queries: [String: String]?) -> Any {
        let url = createUrl(urlString: urlString, queriesDictionary: queries)
        return runHTTPMethod(requestBody: nil, url: url, method: .get, contentType: .json)
    }

    /// POSTメソッドを実行する
    /// - Parameters:
    ///   - urlString: URL文字列
    ///   - requestBody: リクエストボディ
    /// - Returns: レスポンスボディ
    public static func post(urlString: String, requestBody: [String: Any]?) -> AnyObject {
        let url = createUrl(urlString: urlString, queriesDictionary: nil)
        return runHTTPMethod(requestBody: requestBody, url: url, method: .post, contentType: .json) as AnyObject
    }

    // MARK: Private Methods
    
    /// HTTPメソッドを実行する
    /// - Parameters:
    ///   - requestBody: リクエストボディ
    ///   - url: URL
    ///   - method: HTTPメソッド
    ///   - contentType: Content-Type
    /// - Returns: レスポンスボディ
    private static func runHTTPMethod(requestBody: [String: Any]?, url: URL, method: HTTPMethod, contentType: ContentType) -> Any {
        let request = createRequest(requestBody: requestBody, url: url, method: method, contentType: contentType)
        let condition = NSCondition()

        // HTTPメソッドを実行する
        var responseBody: Any! = nil
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                condition.lock()
                // レスポンスボディをJSONからデシリアライズして返す
                responseBody = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                print(responseBody)
            } catch let error {
                print(error.localizedDescription)
                fatalError()
            }
                                                              
            // 共有リソースの解放
            condition.signal()
            condition.unlock()
        }

        condition.lock()
        task.resume()
        condition.wait()
        condition.unlock()

        return responseBody!
    }

    /// リクエストを作成する
    /// - Parameters:
    ///   - requestBody: リクエストボディ
    ///   - url: URL
    ///   - method: HTTPメソッド
    ///   - contentType: Content-Type
    /// - Returns: リクエスト
    private static func createRequest(requestBody: [String: Any]?, url: URL, method: HTTPMethod, contentType: ContentType) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue(contentType.rawValue, forHTTPHeaderField: HeaderField.contentType.rawValue)

        // リクエストボディをディクショナリからJSONへシリアライズする
        if let _requestBody = requestBody {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: _requestBody, options: [])
            } catch let error {
                print(error.localizedDescription)
                fatalError()
            }
        }

        return request
    }

    /// URLを作成する
    /// - Parameters:
    ///   - urlString: URL文字列
    ///   - queriesDictionary: クエリディクショナリ
    /// - Returns: URL
    private static func createUrl(urlString: String, queriesDictionary: [String: String]?) -> URL {
//        let host = Bundle.main.object(forInfoDictionaryKey: "customHost") as! String
        let host = "http://zipcloud.ibsnet.co.jp"
        var components = URLComponents(string: "\(host)\(urlString)")
        if let _queriesDictionary = queriesDictionary {
            components?.queryItems = createQueries(queriesDictionary: _queriesDictionary)
        }

        return (components?.url)!
    }

    /// クエリを作成する
    /// - Parameter queriesDictionary: クエリディクショナリ
    /// - Returns: クエリ配列
    private static func createQueries(queriesDictionary: [String: String]) -> [URLQueryItem] {
        var queries = [URLQueryItem]()
        for query in queriesDictionary {
            queries.append(URLQueryItem(name: query.key, value: query.value))
        }

        return queries
    }
}
