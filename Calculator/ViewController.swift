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
    /**
        Tells if the current value is decimal or not.
     */
    private var decimal = false
    
    @IBAction private func touchButton (_ sender: UIButton){
        
        let numeric = Int(sender.currentTitle!)
        if numeric != nil {
            // Do not count the comma as a number
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
            case "AC": // Clear everything
                display.text = "0"
                decimal = false
                // TODO: Clear any operation button
            
            case "C": // Clear the display, keep the operations
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
                // Without this it would display 0,0
                if replaceZero() {
                    break
                }
                let result = (Double(toComputer(str: display.text!))! / 100)
                display.text = toHuman(str: String(result))
            default:
                // This is just a placeholder
                display.text = "H"
            }
        }
        
    }
    
    /**
        Returns true if the initial 0 needs to be replaced.
     */
    private func replaceZero() -> Bool{
        return display.text?.last == "0"
    }
    /**
        Sets the title for the "clear" button to "C".
     */
    private func setClearButton() {
        if let index = buttons.firstIndex(where: {$0.currentTitle == "AC"}) {
            buttons[index].setTitle("C", for: .normal)
        }
    }
    /**
     Returns a new string replacing all the commas with dots.
     - Parameter str: The source string.
     */
    private func toComputer(str: String) -> String {
        return str.replacingOccurrences(of: ",", with: ".")
    }
    
    /**
     Returns a new string replacing all the dots with commas.
     - Parameter str: The source string.
     */
    private func toHuman(str: String) -> String {
        return str.replacingOccurrences(of: ".", with: ",")
    }
    
    override func viewDidLayoutSubviews() {
        for button in buttons {
            // This makes the buttons round.
            button.layer.cornerRadius = button.bounds.size.height * 0.5
        }
    }


}


extension Bool {
    /**
     Returns an int corresponding to the state of the boolean, 1 or 0
     */
    var int: Int {
        return (self) ? 1 : 0
    }
}
