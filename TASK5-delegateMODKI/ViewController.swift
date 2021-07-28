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
        number1TextField.keyboardType = .decimalPad
        number2TextField.keyboardType = .decimalPad
    }
    
    @IBAction func AdditionButton(_ sender: UIButton) {
        arithmeticOperator.Addition(resultLabel: resultLabel)
    
    }
    @IBAction func subtractionButton(_ sender: UIButton) {
        arithmeticOperator.Subtraction(resultLabel: resultLabel)
    
    }
    @IBAction func multiplicationButton(_ sender: UIButton) {
        arithmeticOperator.Multiplication(resultLabel: resultLabel)
    
    }
    @IBAction func dividedByButton(_ sender: UIButton) {
        
        arithmeticOperator.dividedBy(resultLabel: resultLabel)
    
    }
    
    @IBAction func remainderButton(_ sender: UIButton) {
        arithmeticOperator.remainder(resultLabel: resultLabel)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}//ここでの記述量を減らしたい//Any型はあまり使わない方がいいが・・・
    
extension ViewController: ArithmeticOperatorDelegate {
    func number1() -> Double? {
        let divisor = Double(number1TextField.text!)
        return divisor
    }
    func number2() -> Double? {
        let dividend = Double(number2TextField.text!)
        return dividend
    }
}

