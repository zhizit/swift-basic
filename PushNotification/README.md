# iOSプッシュ通知の実装手順

- Swift version 5.1
- FCM（Firebase Cloud Messaging）

## Swift

- Cording
https://firebase.google.com/docs/cloud-messaging/ios/client?hl=ja
- bundle ID を確認しておく

## CSRの発行

- Certificate Signing Request (CSR)
  - キーチェーンアクセスを起動して、メニューからキーチェーンアクセス -> 証明書アシスタント -> 認証局に証明書を要求を選択
  - 要求の種類→「ディスクに保存」「鍵ペア情報を指定」
  - 後はデフォルト設定でダウンロード

## iOS Developer

1. 開発用証明書を作成 Certificates TYPE: Apple Development
  - CSR をアップロード
2. App IDを作成 Identifiers TYPE: App IDs
  - 「Push Notifications」にチェック
  - SwiftプロジェクトのBundle ID を入力
3. 端末を登録 Devices
  - まだ未登録なら検証端末のUDIDを登録
4. プロビジョニングプロファイルを作成 Profiles TYPE: iOS App Development
  - 先程作成したApp ID、端末を指定する
  - profile をダウンロード
5. プッシュ通知用のAPNs証明書を作成 Certificates TYPE: Apple Push Services
  - 先程作成したApp ID、CSRファイルを選択

## キーチェーンアクセスへ登録

1. APNs証明書をダブルクリック
2. 「Apple Development iOS Push Services……」を選択
3. 証明書を右クリックして、「"Apple Development iOS Push Services……"を書き出す」を選択
4. パスワードを指定して保存

## Firebase へ登録と設定

1. プロジェクト、アプリをiOSアプリを登録
https://console.firebase.google.com/u/0/?hl=ja

2. 設定 > クラウドメッセージング > iOS アプリの設定 > APNs 証明書 に先程書き出した証明書をアップロード
3. GUIからやる場合 プロジェクトのメニューバー > Cloud Messaging > 新しい通知

これでメッセージ文章を入力し、送信ボタンを押下するとプッシュ通知が送信できる


MEMO: 作業時間1時間
