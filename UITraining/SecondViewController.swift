//
//  SecondViewController.swift
//  UITraining
//
//  Created by zhizit on 2019/09/19.
//  Copyright © 2019 zhizit. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(sender: UIButton) {
        // animated: 遷移をするときのアニメーション completion: 画面遷移が終了した後に行う処理
        dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
