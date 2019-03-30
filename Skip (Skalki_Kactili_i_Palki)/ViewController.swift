//
//  ViewController.swift
//  Skip (Skalki_Kactili_i_Palki)
//
//  Created by Михаил Зайцев on 20/03/2019.
//  Copyright © 2019 Михаил Зайцев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberFromScreen :Double = 0
    var firstNum : Double = 0
    var opertion : Int = 0
    var mathSign : Bool = false
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true {
            result.text = String (sender.tag)
            mathSign = false
        }
        else {
            result.text = result.text! + String (sender.tag)
        }
        numberFromScreen = Double (result.text!)!
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 15 {
            firstNum = Double(result.text!)!
            
            if sender.tag == 11 { // деление
                result.text = "÷"
            }
            else if sender.tag == 12 { // умножение
                result.text = "✕"
            }
            else if sender.tag == 13 { // вычитание
                result.text = "–"
            }
            else if sender.tag == 14 { // сложение
                result.text = "+"
            }
            else if sender.tag == 17 { // целочисленное деление
                result.text = "%"
            }
            
            opertion = sender.tag
            mathSign = true
        }
    
        else if sender.tag == 15 { // счёт
            if opertion == 11 {
                result.text = String(firstNum / numberFromScreen)
            }
            else if opertion == 12 {
                result.text = String(firstNum * numberFromScreen)
            }
            else if opertion == 13 {
                result.text = String(firstNum - numberFromScreen)
            }
            else if opertion == 14 {
                result.text = String(firstNum + numberFromScreen)
            }
            else if opertion == 17 {
                result.text = String(firstNum.truncatingRemainder(dividingBy: numberFromScreen))
            }
        }
        else if sender.tag == 10 {
            result.text = ""
            firstNum = 0
            numberFromScreen = 0
            opertion = 0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}


