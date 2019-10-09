//  File.swift
//  ApiBaseTraining

import Foundation

class ApiSampleService {

    // MARK: Public Methods
    
    /// GET Sample API 
    public static func searchDisneylandAddress(postCode: String) -> AnyObject {
        let disneylandAddress: [String: Any] = getAddress(zipcode: postCode)
        let results = disneylandAddress["results"] as! [[String: Any]]
        return results[0] as AnyObject
    }

    /// POST Sample API
    public static func postSample() -> AnyObject? {
        let params: [String: String] = [
            "hoge_id": "hoge"
        ]

        return HttpClient.post(urlString: "/url/path", requestBody: params) as AnyObject
    }

    // MARK: Private Methods

    private static func getAddress(zipcode: String) -> [String: Any] {
        let queries = ["zipcode": zipcode]
        return HttpClient.get(urlString: "/api/search", queries: queries) as! [String: Any]
    }
}
