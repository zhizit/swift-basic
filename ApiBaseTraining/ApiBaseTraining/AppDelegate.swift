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
    // 検索ボタンを利用するかの判定です
    var isEnablesearchBtn: Bool = true

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setMessages(title: "住所検索", detail: nil)
        return true
    }

    /// 画面に表示するViewを設定します
    private func setMessages(title: String?, detail: String?) -> Void {
        titleText = title ?? ""
        detailText = detail ?? ""
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = ViewController()
        self.window?.makeKeyAndVisible()
    }

}

