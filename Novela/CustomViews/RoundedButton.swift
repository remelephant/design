//
//  RoundedButton.swift
//  Novela
//
//  Created by Vahagn Gevorgyan on 12/20/17.
//  Copyright © 2017 Vahagn Gevorgyan. All rights reserved.
//

import UIKit

@IBDesignable class RoundedButton: UIButton {

    @IBInspectable var radius: CGFloat = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = radius
    }
    
    private func setup() {
        
    }
}
