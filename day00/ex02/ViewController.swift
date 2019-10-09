//
//  ViewController.swift
//  ex02
//
//  Created by Tyrone STEPHEN on 2019/10/08.
//  Copyright © 2019 Tyrone STEPHEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Constants to prevent overflow
    let minInt: Int = -2147483648
    let maxInt: Int = 2147483647
    
    // Performing math
    var awaitingSecondNumber: Bool = false;
    var previousNumber: Int = 0;
    var currentNumber: Int = 0
    var currentOperator: String = ""
    var handledBeg: Bool = false;
    
    @IBOutlet weak var numberDisplayed: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: number handlers
    
    @IBAction func numberPressed(_ sender: UIButton) {
        print(sender.currentTitle!)
        
        if (awaitingSecondNumber == true) {
            if (handledBeg == false) {
                numberDisplayed.text = sender.currentTitle!
                handledBeg = true
            } else {
                if (allowDigit(sender.currentTitle!) == false) {
                    print("You would overflow, we have stopped you!")
                    return
                }
                numberDisplayed.text = numberDisplayed.text! + sender.currentTitle!
            }
        } else {
            
            if (handledBeg == false) {
                numberDisplayed.text = sender.currentTitle
                handledBeg = true
                return
            }
            
            if (allowDigit(sender.currentTitle!) == false) {
                print("You would overflow, we have stopped you!")
                return
            }
            
            if numberDisplayed.text == "0" {
                numberDisplayed.text = sender.currentTitle
            } else {
                numberDisplayed.text = numberDisplayed.text! + sender.currentTitle!
            }
        }
    }
    
    // MARK: operations

    @IBAction func operatorHandler(_ sender: UIButton) {
        if (sender.currentTitle! == "=") {
            
            if (numberDisplayed.text == currentOperator) {
                return;
            }
            
            let result = getResult(currentOperator, previousNumber, Int(numberDisplayed.text!)!)
            numberDisplayed.text = result
            return
        }
        currentOperator = sender.currentTitle!
        previousNumber = Int(numberDisplayed.text!)!
        numberDisplayed.text = currentOperator
        awaitingSecondNumber = true
        handledBeg = false
    }
    
    //MARK: helpers
    
    func getResult(_ op: String, _ prev: Int, _ curr: Int) -> String {
        var res: CLong = 0
        
        switch op {
        case "+":
            res = prev + curr
            return numberFormatted(res)
        case "-":
            res = prev - curr
            return numberFormatted(res)
        case "/":
            if (curr == 0) {
                return numberFormatted(0)
            }
            res = prev / curr
            return numberFormatted(res)
        case "x":
            res = prev * curr
            return numberFormatted(res)
        default:
            print("Unsupported Operation")
            return "0"
        }
    }
    
    func numberFormatted(_ num: CLong) -> String {
        if (num < minInt) {
            return String(minInt)
        } else if (num > maxInt) {
            return String(maxInt)
        }
        
        return String(num)
    }
    
    func allowDigit(_ digit: String) -> Bool {
        let result: CLong = CLong(numberDisplayed.text! + digit)!
        
        if ((result > maxInt) || (result < minInt)) {
            return false
        }
        return true
    }
    
    //MARK: reset button
    @IBAction func resetLabel(_ sender: UIButton) {
        numberDisplayed.text = "0"
        previousNumber = 0;
        currentOperator = ""
        awaitingSecondNumber = false
        handledBeg = false
    }
    
    //MARK: neg button
    
    @IBAction func makeNegative(_ sender: UIButton) {
        
        if (numberDisplayed.text != currentOperator) {
            var res:CLong = CLong(numberDisplayed.text!)!
            
            res *= -1;
            numberDisplayed.text = numberFormatted(res)
        }
    }
}

