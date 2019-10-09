## プロジェクトを git 管理するとき

- .gitignoreファイルに ```UserInterfaceState.xcuserstate```と記載する。UserInterfaceStateはXcodeを触るたびに不要な差分を出しているためGit管理不要

## storyboard を使わない実装

- 以下のファイルと設定を削除
  - デフォルトで生成されるViewController.swiftと、SceneDelegate.swift、storyboardファイルを全て削除
  - Info.plist 「Main storyboard file base name」の「-」ボタンを押下して削除
  - Info.plist 「Application Scene Manifest」の「-」ボタンを押下してを削除

## APIのHOSTは環境によって切り替える（今回は、Info.plist をまとめて1つで管理するものとします）

  - TARGETSを設定する
    - 水色アイコンのプロジェクトを開き、TARGETSを選択
    - TARGET名を「DEV_[プロジェクト名]」にしておく
    - Combined Labels の横のプラスボタンから「Add User-Defined」を選択
    - 「CUSTOM_HOST」のように、任意の変数名で、設定したい環境のドメイン名を設定する
    - 右クリックしてDuplicateを選択し、後は増やしたい環境分だけ同じように設定していく
  - Info.plist を設定する
    - Info.plist > Information Property List 配下に、key：[好きな変数名] value:$(CUSTOM_HOST) を設定する
  - HOSTを呼び出す処理を記載する
    - ```let host = Bundle.main.object(forInfoDictionaryKey: "[前手順で設定した好きな変数名]") as! String```
  - Xcode の左上のアイコンから Schemes を環境別に作成する
    - 「Manage Schemes ...」を選択
    - 「＋」ボタンを押下すると TARGET を指定できるので、環境分だけ　Schemes を作成する
    - 後は確認したいSchemeを選択すれば環境が切り替わります