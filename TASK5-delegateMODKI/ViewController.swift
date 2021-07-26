//
//  ViewController.swift
//  TASK5-delegateMODKI
//
//  Created by IwasakIYuta on 2021/07/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var number1TextField: UITextField!
    @IBOutlet private var number2TextField: UITextField!
    
    @IBOutlet private var resultLabel: UILabel!
    private  let arithmeticOperator = ArithmeticOperator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arithmeticOperator.delegate = self
        arithmeticOperator.viewController = self
        number1TextField.keyboardType = .decimalPad
        number2TextField.keyboardType = .decimalPad
    }
    
    @IBAction func dividedByButton(_ sender: UIButton) {
        arithmeticOperator.dividedBy(resultLabel: resultLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}//ここでの記述量を減らしたい//Any型はあまり使わない方がいいが・・・
    
extension ViewController: ArithmeticOperatorDelegate {
    func number1() -> Any {
        guard let divisor = Int(number1TextField.text!) else {
            return ""
        }
        return divisor
    }
    func number2() -> Any {
        guard let dividend = Int(number2TextField.text!) else {
            return ""
        }
        return dividend
    }
}

