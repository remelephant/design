//
//  CustomButton.swift
//  Novela
//
//  Created by Vahagn Gevorgyan on 12/19/17.
//  Copyright © 2017 Vahagn Gevorgyan. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0
    @IBInspectable var borderColor: UIColor = UIColor.black
    @IBInspectable var borderWidth: CGFloat = 0.5
    @IBInspectable var buttonImage: UIImage?
    @IBInspectable var titleText: String = ""
    
    private var customBackgroundColor = UIColor.white
    
    // MARK: - View
    @IBInspectable var viewRotation: CGFloat {
        get {
            return 0
        } set {
            let radians = CGFloat(CGFloat(Double.pi) * CGFloat(newValue) / CGFloat(180.0))
            self.transform = CGAffineTransform(rotationAngle: radians)
        }
    }
    
    // MARK: - Button image view
    var imageView = UIImageView()
    @IBInspectable var imageSize: CGFloat = 100
    @IBInspectable var imageRotation: CGFloat {
        get {
            return 0
        } set {
            let radians = CGFloat(CGFloat(Double.pi) * CGFloat(newValue) / CGFloat(180.0))
            imageView.transform = CGAffineTransform(rotationAngle: radians)
        }
    }
    
    // MARK: - Button title label
    var title = UILabel()
    @IBInspectable var titleHeight: CGFloat = 30
    @IBInspectable var titleWidth: CGFloat = 100
    @IBInspectable var titlePosition: CGFloat = 0
    @IBInspectable var titleRotation: CGFloat {
        get {
            return 0
        } set {
            let radians = CGFloat(CGFloat(Double.pi) * CGFloat(newValue) / CGFloat(180.0))
            title.transform = CGAffineTransform(rotationAngle: radians)
        }
    }
    
    // MARK: - Functions
    override var backgroundColor: UIColor?{
        didSet {
            customBackgroundColor = backgroundColor!
            super.backgroundColor = UIColor.clear
        }
    }
    
    func setup() {
        layer.shadowColor = UIColor.black.cgColor;
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5.0;
        layer.shadowOpacity = 0.5;
        layer.masksToBounds = true
        layer.masksToBounds = true
        super.backgroundColor = UIColor.clear
        addSubview(imageView)
        addSubview(title)
        title.layer.zPosition = 1
        title.textColor = UIColor.white
        title.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override func draw(_ rect: CGRect) {
        customBackgroundColor.setFill()
        UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius ).fill()
        
        configureButtonImageView()
        configureButtonTitleLabel()
        
        let borderRect = bounds.insetBy(dx: borderWidth/2, dy: borderWidth/2)
        let borderPath = UIBezierPath(roundedRect: borderRect, cornerRadius: cornerRadius - borderWidth/2)
        borderColor.setStroke()
        borderPath.lineWidth = borderWidth
        borderPath.stroke()
    }
    
    private func configureButtonImageView() {
        
        imageView.frame.size = CGSize(width: imageSize, height: imageSize)
        imageView.center = CGPoint(x: bounds.midX, y: bounds.midY)
        
        if let image = buttonImage {
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
        }
    }
    
    private func configureButtonTitleLabel() {
        title.text = titleText
        title.font = UIFont.systemFont(ofSize: titleHeight)
        title.frame.size = CGSize(width: titleWidth, height: titleWidth)
        title.center = CGPoint(x: bounds.midX, y: bounds.midY - titlePosition)
    }
}
