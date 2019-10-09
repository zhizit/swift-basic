//  AppDelegate.swift
//  ApiBaseTraining

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // UIを制御します
    var window: UIWindow?
    // Viewに表示するタイトルテキストです
    var titleText: String = ""
    // Viewに表示する詳細テキストです
    var detailText: String = ""
    // アプリを閉じるボタンを利用するかの判定です
    var isEnableAppCloseBtn: Bool = true

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let host = Bundle.main.object(forInfoDictionaryKey: "customHost") as! String
        print(host)

        return true
    }
}

