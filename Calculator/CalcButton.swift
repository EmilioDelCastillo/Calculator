//
//  CalcButton.swift
//  Calculator
//
//  Created by Emilio Del Castillo on 08/02/2021.
//

import UIKit

@IBDesignable
class CalcButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
//            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
