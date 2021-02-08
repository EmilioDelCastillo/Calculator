//
//  ViewController.swift
//  Calculator
//
//  Created by Emilio Del Castillo on 08/02/2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet private var buttons: [UIButton]!
    @IBOutlet private weak var display: UILabel!
    private var decimal = false
    @IBAction private func touchButton (_ sender: UIButton){
        
        let numeric = Int(sender.currentTitle!)
        if numeric != nil {
            if display.text?.count == 9 + decimal.int {
                return;
            }
            setClearButton()
            if replaceZero() {
                display.text?.removeLast()
            }
                display.text?.append(String(numeric!))
            
        } else {
            switch sender.currentTitle {
            case "AC":
                display.text = "0"
                decimal = false
            case "C":
                display.text = "0"
                decimal = false
                sender.setTitle("AC", for: .normal)
            case ",":
                if !decimal {
                    display.text?.append(",")
                    decimal = true
                }
            case "⁺∕₋":
                if display.text?.first == "-" {
                    display.text?.removeFirst()
                } else {
                    display.text?.insert("-", at: display.text!.startIndex)
                }
            case "%":
                if replaceZero() {
                    break
                }
                let result = (Double(toComputer(str: display.text!))! / 100)
                display.text = toHuman(str: String(result))
            default:
                display.text = "H"
            }
        }
        
    }
    
    private func replaceZero() -> Bool{
        return display.text?.last == "0"
    }
    
    private func setClearButton() {
        if let index = buttons.firstIndex(where: {$0.currentTitle == "AC"}) {
            buttons[index].setTitle("C", for: .normal)
        }
    }
    
    private func toComputer(str: String) -> String {
        return str.replacingOccurrences(of: ",", with: ".")
    }
    private func toHuman(str: String) -> String {
        return str.replacingOccurrences(of: ".", with: ",")
    }
    
    override func viewDidLayoutSubviews() {
        for button in buttons {
            button.layer.cornerRadius = button.bounds.size.height * 0.5
        }
    }


}

extension Bool {
    var int: Int {
        return (self) ? 1 : 0
    }
}
