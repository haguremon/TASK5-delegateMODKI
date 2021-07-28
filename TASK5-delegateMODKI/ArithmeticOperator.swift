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
    func number1() -> Double? //もっといい取得の方法があるはず・・・
    func number2() -> Double? //throw使うのも面白いけど。。。トライでやるとコード量増える
    //ゲットセットでよりよくできそうな気がするけどわからへん
}

//処理を委任するクラス//もっと柔軟性のあるクラスにしたい...//他のControllerでも使えるから良き
class ArithmeticOperator {
   typealias VCArithmeticOperatorDelegate = ArithmeticOperatorDelegate & UIViewController
    weak var delegate: VCArithmeticOperatorDelegate?
//よりはUIViewControllerの方がいいか？
    func dialogAlert(message: String) {
        let alert = UIAlertController(title: "Task5", message: message, preferredStyle: .alert )
        alert.addAction(UIAlertAction(title: "ok", style: .default))
        self.delegate?.present(alert, animated: true)
    }
    //割り算をする処理
    func dividedBy(resultLabel: UILabel){
        guard let divisor = delegate?.number1() else {
           //Any型をダウンキャストできなかった場合ここがよばれる
            return dialogAlert(message: "割られる数を入力してください")
        
        }
        guard let  dividend = delegate?.number2() else {
            
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
        guard let number1 = delegate?.number1(),
              let  number2 = delegate?.number2() else { return }
        
        resultLabel.text = String(number1 + number2)
    }
    func Subtraction(resultLabel: UILabel){
        guard let number1 = delegate?.number1(),
              let  number2 = delegate?.number2() else { return }
        
        resultLabel.text = String(number1 - number2)
    }
    func Multiplication(resultLabel: UILabel){
        guard let number1 = delegate?.number1(),
              let  number2 = delegate?.number2() else { return }
        
        resultLabel.text = String(number1 * number2)
    }
    func remainder(resultLabel: UILabel){
        guard let number1 = delegate?.number1(),
              let  number2 = delegate?.number2() else { return }
         let intValue1 = Int(number1)
         let intValue2 = Int(number2)
        resultLabel.text = String(intValue1 % intValue2)
    }
}
