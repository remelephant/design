//
//  RoundedButton.swift
//  Novela
//
//  Created by Vahagn Gevorgyan on 12/20/17.
//  Copyright © 2017 Vahagn Gevorgyan. All rights reserved.
//

import UIKit

@IBDesignable class RoundedButton: UIButton {    
    @IBInspectable var radius: CGFloat = 0.0 {
        didSet{
            self.layer.cornerRadius = radius
        }
    }
}
