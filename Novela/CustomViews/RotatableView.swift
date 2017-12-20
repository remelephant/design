//
//  RotatableView.swift
//  Novela
//
//  Created by Vahagn Gevorgyan on 12/19/17.
//  Copyright © 2017 Vahagn Gevorgyan. All rights reserved.
//

import UIKit

@IBDesignable class RotatableView: UIView {
    @IBInspectable var viewRotation: CGFloat {
        get {
            return 0
        } set {
            let radians = CGFloat(CGFloat(Double.pi) * CGFloat(newValue) / CGFloat(180.0))
            self.transform = CGAffineTransform(rotationAngle: radians)
        }
    }
    
    @IBInspectable var radius: CGFloat = 0.0 {
        didSet{
            self.layer.cornerRadius = radius
        }
    }
}
