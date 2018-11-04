//
//  QuoteCell.swift
//  ngemeal
//
//  Created by Andy Jiehan on 04/11/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class QuoteCell: UICollectionViewCell {
    let gradientBG = CAGradientLayer()
    var gradientSet = [[CGColor]]()
    var currentGradient = 0
    
    let greenStart = Colors.mainGradientStart.cgColor
    let blueEnd = Colors.mainGradientEnd.cgColor
    
    let quoteLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "\"One should eat to live, not live to eat.\""
        lbl.textColor = .white
        lbl.font = FontType.init(size: 30).bold
        lbl.textAlignment = .center
        lbl.lineBreakMode = .byWordWrapping
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let personLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "- Benjamin Franklin"
        lbl.textColor = .white
        lbl.font = FontType.init(size: 20).regular
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(quoteLabel)
        self.addSubview(personLabel)
        setupGradientBG()
        setupLabelConstraint()
    }
    
    func setupLabelConstraint() {
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
//        quoteLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        quoteLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        quoteLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        quoteLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
        
        personLabel.translatesAutoresizingMaskIntoConstraints = false
        personLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        personLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    }
    
    func setupGradientBG() {
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 2
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 5).cgPath
        
        
        gradientSet.append([greenStart, blueEnd])
        gradientSet.append([blueEnd, greenStart])
        
//        let testCol1 = Colors.veggie.cgColor
//        let testCol2 = Colors.protein.cgColor
//        let testCol3 = Colors.staple.cgColor
//
//        gradientSet.append([testCol1, testCol2])
//        gradientSet.append([testCol2, testCol3])
//        gradientSet.append([testCol3, testCol1])
        
        gradientBG.frame = self.bounds
        gradientBG.cornerRadius = self.layer.cornerRadius
        gradientBG.colors = gradientSet[currentGradient]
        gradientBG.startPoint = CGPoint(x: 0.4, y: 0.0)
        gradientBG.endPoint = CGPoint(x: 0.6, y: 1.0)
        gradientBG.drawsAsynchronously = true
        self.layer.insertSublayer(gradientBG, at: 0)
        
        animateGradient()
    }
    
    func animateGradient() {
        if currentGradient < gradientSet.count - 1 {
            currentGradient += 1
        } else {
            currentGradient = 0
        }
        
        let gradientAnimation = CABasicAnimation(keyPath: "colors")
        gradientAnimation.duration = 3.0
        gradientAnimation.toValue = gradientSet[currentGradient]
        gradientAnimation.fillMode = CAMediaTimingFillMode.forwards
        gradientAnimation.isRemovedOnCompletion = false
        gradientAnimation.autoreverses = true
        gradientAnimation.repeatCount = Float.infinity
        gradientBG.add(gradientAnimation, forKey: "colorChange")
        
        let startPointAnimation = CABasicAnimation(keyPath: "startPoint")
        startPointAnimation.fromValue = [0.4, 0.0]
        startPointAnimation.toValue = [0.6, 0.4]
        startPointAnimation.duration = 5.0
        startPointAnimation.autoreverses = true
        startPointAnimation.repeatCount = Float.infinity
        gradientBG.add(startPointAnimation, forKey: "startPoint")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
