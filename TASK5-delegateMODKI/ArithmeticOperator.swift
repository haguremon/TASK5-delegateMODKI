//
//  ArithmeticOperator.swift
//  TASK5-delegateMODKI
//
//  Created by IwasakIYuta on 2021/07/27.
//

import Foundation
import UIKit
//委譲するプロトコルで宣言
//必要な条件
protocol ArithmeticOperatorDelegate: AnyObject{
    func number1() -> Any //もっといい取得の方法があるはず・・・
    func number2() -> Any //throw使うのも面白いけど。。。トライでやるとコード量増える
    //ゲットセットでよりよくできそうな気がするけどわからへん
}

//処理を委任するクラス//もっと柔軟性のあるクラスにしたい...//他のControllerでも使えるから良き
class ArithmeticOperator {
    weak var delegate: ArithmeticOperatorDelegate?
    weak var viewController: UIViewController?//よりはUIViewControllerの方がいいか？
    func dialogAlert(message: String) {
        let alert = UIAlertController(title: "Task5", message: message, preferredStyle: .alert )
        alert.addAction(UIAlertAction(title: "ok", style: .default))
        self.viewController?.present(alert, animated: true)
    }
    //割り算をする処理
    func dividedBy(resultLabel: UILabel){
        guard let divisor = delegate?.number1() as? Double else {
           //Any型をダウンキャストできなかった場合ここがよばれる
            return dialogAlert(message: "割られる数を入力してください")
        
        }
        guard let  dividend = delegate?.number2() as? Double else {
            
            return dialogAlert(message: "割る数を入力してください")
        
        }
        if dividend.isZero {
          return dialogAlert(message: "割る時は０を入力しないでください")
       
        } else {
        
        resultLabel.text = String(divisor / dividend)
        
        }
    }
    //ここから下はいらないけど作った色々とカスタマイズできるの最高
    func Addition(resultLabel: UILabel){
        guard let number1 = delegate?.number1() as? Double,
              let  number2 = delegate?.number2() as? Double else { return }
        
        resultLabel.text = String(number1 + number2)
    }
    func Subtraction(resultLabel: UILabel){
        guard let number1 = delegate?.number1() as? Double,
              let  number2 = delegate?.number2() as? Double else { return }
        
        resultLabel.text = String(number1 - number2)
    }
    func Multiplication(resultLabel: UILabel){
        guard let number1 = delegate?.number1() as? Double,
              let  number2 = delegate?.number2() as? Double else { return }
        
        resultLabel.text = String(number1 * number2)
    }
    func remainder(resultLabel: UILabel){
        guard let number1 = delegate?.number1() as? Int,
              let  number2 = delegate?.number2() as? Int else { return }
        
        resultLabel.text = String(number1 % number2)
    }
}
