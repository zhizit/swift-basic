//
//  ViewController.swift
//  UITraining
//
//  Created by zhizit on 2019/09/19.
//  Copyright © 2019 zhizit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var myLabel: UILabel!

    @IBAction func buttonTapped(sender: UIButton) {
        // ラベルのテキストを変更
        myLabel.text = "Hello world";
    }

    /**
     * 基礎文法をまとめた
     */
    func playGround() {
        let oneNumber: Int = 123
        var twoNumber: Double = 123

        // nil と optional ----------------------------------------
        var threeNumber: Int? = 7
        // 「!」「?」のついた変数をオプショナル型：nilという状態を許容できる
        // 何も設定しなければ初期値 nil（空である状態）
        
        // var errorResult = oneNumber + threeNumber // ERR! Optional型はnil の可能性があるため四則演算できない
        let successResult = oneNumber + threeNumber! // SUCCESS! 「!」で nil でないことを表す
        print(successResult);
        
        // 文字列 --------------------------------------------------
        // "\(oneNumber)" で数値を文字列として扱うことができる
        let oneString: String = "hello"
        let twoString: String = "world"
        let oneTwoString: String = oneString + " " + twoString + "\(oneNumber)" //hello world123
        print(oneTwoString)

        // 分岐の書き方 ---------------------------------------------
        let isHoge = false
        if isHoge {
            // isHoge === True
        } else if oneNumber < 10 {
            // oneNumber < 10
        } else {
            // other
        }

        // 配列の書き方 ---------------------------------------------
        let aList: [Int] = [1, 2, 3, 4, 5]
        print(aList[0]) // 1
        
        var bList: [Int] = [1, 2, 3, 4, 5]
        bList.append(9) // [1, 2, 3, 4, 5, 6]
        bList[2] = 9 // [1, 2, 9, 4, 5, 6]
        bList.remove(at: 3) // [1, 2, 9, 5, 6]
        
        // ディクショナリの書き方 --------------------------------------
        let aDictionary = ["Taro": 1985, "Hanako": 1986]
        print("\(aDictionary["Taro"])") // 1985
        
        var cDictionary: [String: Int] = ["Taro": 1985, "Hanako": 1986]
        cDictionary["Jiro"] = 1988 // ["Taro": 1985, "Hanako": 1986, "Jiro": 1988] // 存在しない key の場合は新規追加
        cDictionary["Taro"] = 1984 // ["Taro": 1984, "Hanako": 1986, "Jiro": 1988]// 存在する key の場合は更新
        cDictionary.removeValue(forKey: "Hanako") //["Taro": 1984, "Jiro": 1988]
        
        // ループの書き方 --------------------------------------------
        for i in 0..<10 {
            print(i) // 0 1 2 3 4 5 6 7 8 9
        }

        for i in 0...10 {
            print(i) // 0 1 2 3 4 5 6 7 8 9 10
        }

        var roopExamples: [Int] = []
        
        for i in 0..<10 {
            roopExamples.append(i) // [0 1 2 3 4 5 6 7 8 9]
        }
        
        for i in roopExamples {
            print(i) // 0 1 2 3 4 5 6 7 8 9
        }

        // Static へのアクセス ------------------------------------------
        Dog.bread = "Akitaken"
        print(Dog.bread)

        // インスタンスの生成 --------------------------------------------
        let pochi = Dog(name: "Pochi", age: 3)
        print(pochi.bark())
        
        // 継承したクラスの変数にアクセスしてみた
        pochi.color = "Brown"

        let tama = Cat(name: "Tama", breed: "Russian Blue")
        print(tama.name) // "Tama"
        var mike = Cat(name: "Mike", age: 5, breed: nil)

        
        // ReferenceOrValue： 参照渡しと値渡し -------------------------
        // Class の代入は参照渡しになって値が引き継がれる
        let hachi = pochi
        hachi.age = 10
        print(pochi.age) // pochi.age も 10になる →参照渡し

        // Struct の代入は値渡しになってコピーが作られる
        var nora = mike
        nora.age = 10
        print(mike.age) // mike.age は 5 のままになる →値渡し

        // 変数の代入も値渡しになってコピーが作られる
        var aProperty = 3
        var bProperty = aProperty
        bProperty = 7
        print(aProperty) // 3 →値渡し
        print(bProperty) // 7
        
        // Enum 列挙型 ----------------------------------------------
        var sig: Signal
        sig = Signal.Blue
        sig = .Red // Signalは省略することもできる

        // Switch の書き方 ------------------------------------------
        switch sig {
        case .Blue:
            print("Blue!")
        case .Yellow:
            print("Yellow!")
        default:
            print("Other!")
        }

        let result = getAgeMessage("Pochi", 5)
        print(result)

        let shark = Shark()
        shark.swim()
        
    }
}



// Animal クラスを継承してる
class Dog: Animal {
    static var bread = ""

    var name = ""
    var age = 0

    // イニシャライザ -----------------------------------
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    // -----------------------------------------------

    func bark() -> String {
        return "My name is " + name + "and age is " + "\(age)"
    }
}


class Animal {
    var color = ""
}

// struct = 構造体
struct Cat {
    var name = ""
    var age = 0
    var breed: String?
}

//Enum 列挙型
enum Signal {
    case Blue
    case Yellow
    case Red
}

// Closure の書き方 ------------------------------------------
let getAgeMessage = {(name: String, age: Int) -> String in
    return  name + ": I'm \(age) years old."
}

//func sayAge(name: String, age: Int, getMessage: (String, Int) -> String) {
//    return getMessage(name, age)
//}

// Protocol の書き方 ------------------------------------------
protocol Fish {
    var color: String {get set} // 値の取得と設定ができる
    func swim()
}

class Shark: Fish {
    var color: String = "Blue"
    func swim() {
        print("Now quickly swimming ...")
    }
}

struct Ray: Fish {
    var color: String = "Brown"
    func swim() {
        print("Now slowly sqimming...")
    }
}


// Delegate の使い方 ------------------------------------------

protocol SardineDelegate: class {
    func didEatSardine()
}
class Sardine {
    // お互いがお互いのオブジェクトを参照してしまう状態（循環参照）を回避するために、weak でメモリに制限をつけることができる
    weak var delegate: SardineDelegate? // 参照用変数は参照している数にカウントしないように制限
    func eaten() {
        print("I was eaten...")
        delegate?.didEatSardine() // 実装されていることが保証されている。SardineDelegateのdidEatSardineを実行することができる
        // 変数をプロトコルに従わせることによって、プロトコルが導入されたｐクラスや構造体がなくてもメソッドを記述することができる
        // delegate? はDelegateがnilでない場合のみメソッドを実行するという意味になる
    }
}

class Tuna: SardineDelegate {
    func eat() {
        let sardine = Sardine()
        sardine.delegate = self
        sardine.eaten()
    }
    func didEatSardine() {
        print("I ate a sardine!")
    }
}

