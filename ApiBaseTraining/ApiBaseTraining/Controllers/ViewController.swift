//  ViewController.swift
//  ApiBaseTraining

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadLayout()
    }

    /// レイアウトを設定します
    public func loadLayout() -> Void {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        searchBtn.alpha = appDelegate.isEnablesearchBtn ? 1 : 0 // 0: 非表示、1: 表示
        titleLabel.text = appDelegate.titleText
        detailLabel.text = appDelegate.detailText
        view.addSubview(searchBtn)
        view.addSubview(titleLabel)
        view.addSubview(detailLabel)
        view.backgroundColor = UIColor.white
    }

    /// 検索結果を表示
    @objc func searchDisney(_ sender: UIButton) {
        let result = ApiSampleService.searchDisneylandAddress(postCode: "279-0031")
        searchBtn.alpha = 0
        titleLabel.text = "検索結果"
        detailLabel.text = "\(result)"
        print(result as Any)
    }

    // MARK: UI components

    private lazy var searchBtn: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(self.searchDisney(_:)), for: .touchUpInside)
        button.setTitle("ディズニーの住所を表示する", for: .normal)
        button.backgroundColor = UIColor.darkGray
        button.frame = CGRect(x: 0, y: 0, width: 250, height: 40)
        button.center = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height / 2)
        button.layer.cornerRadius = 10
        return button
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        label.center = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height / 3)
        label.textAlignment = NSTextAlignment.center // テキストを中央寄せ
        return label
    }()

    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 300, height: 700)
        label.center = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height / 2)
        label.numberOfLines = 0 // 改行して文字を表示するのを許可
        return label
    }()

}
