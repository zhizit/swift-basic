//
//  AppDelegate.swift
//  PushNotification


import UIKit
import Firebase
import UserNotifications


@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
//        これで値を受け取ることができる
//        let result = userInfo["hoge"] as! String)
        completionHandler()
    }
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        FirebaseApp.configure()

        if #available(iOS 10.0, *) {
          // For iOS 10 display notification (sent via APNS)
          UNUserNotificationCenter.current().delegate = self

          let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
          UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: {_, _ in })
        } else {
          let settings: UIUserNotificationSettings =
          UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
          application.registerUserNotificationSettings(settings)
        }

        application.registerForRemoteNotifications()


        return true
    }
  
// サーバーサイドからプッシュ通知を送る場合、InstanceIDを連携する必要があります
//    // APNsへプッシュ通知の利用の登録が完了すると呼び出される関数です
//    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        InstanceID.instanceID().instanceID { (result, error) in
//            if let error = error {
//                NSLog("ERROR")
//            } else if let result = result {
//                let response = sendTokenToServer(token: result.token)// 省略
//                if response == nil {
//                    return
//                }
//                let statusCode = response?["statusCode"] ?? 0
//                if statusCode as! Int == 200 {
//                    NSLog("SUCCESS")
//                } else {
//                   NSLog("ERROR")
//                }
//            }
//        }
//    }
    
//    // APNsへプッシュ通知の利用の登録が失敗すると呼び出される関数です
//    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
//         NSLog("ERROR")
//    }
}
