//
//  TimeStampView.swift
//  ngemeal
//
//  Created by Andy Jiehan on 23/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class TimeStampView: UIView {
    
    var time: Date?
    
    var timeLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont(name: "Avenir-Heavy", size: 12)
        lbl.text = "00:00" //Make this dynamic according to the data
        return lbl
    }()
    
    convenience init(frame: CGRect, time: Date) {
        self.init()
        self.frame = CGRect(x: 0, y: 0, width: 57, height: 22)
        self.time = time
        setupViewStyle()
        
        self.addSubview(timeLabel)
        
        setupLabelConstraint()
    }
    
    func setupLabelConstraint() {
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func setupViewStyle() {
        //Rounded Corner
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        
        //Adding gradient bg
        let gradientBG = CAGradientLayer().primaryGradientLayer()
        gradientBG.cornerRadius = self.layer.cornerRadius
        gradientBG.frame = self.frame
        self.layer.addSublayer(gradientBG)
    }
}
