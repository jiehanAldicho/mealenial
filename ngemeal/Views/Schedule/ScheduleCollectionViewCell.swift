//
//  ScheduleCollectionViewCell.swift
//  ngemeal
//
//  Created by Andy Jiehan on 25/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class ScheduleCollectionViewCell: UICollectionViewCell {
    
    var timeLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "01:00" //Shoud be from date object
        lbl.textColor = Colors.textBlack
        lbl.font = UIFont(name: "Avenir-Black", size: 35)
        return lbl
    }()
    
    let toggleButton: UISwitch = {
        let swtch = UISwitch()
        swtch.setOn(true, animated: true)
        swtch.onTintColor = Colors.mainOrange
//        swtch.thumbTintColor = Colors.backgroundColor
        return swtch
    }()
    
    var popoverButton = MoreOptionButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.backgroundColor
        setupCellStyle()
        
        popoverButton = MoreOptionButton.init(frame: CGRect.zero)
        
        self.addSubview(timeLabel)
        self.addSubview(toggleButton)
        self.addSubview(popoverButton)
        
        setupTimeLabelConstraint()
        setupPopoverButtonConstraint()
        setupToggleButtonConstraint()
        
        popoverButton.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
    }
    
    func setupTimeLabelConstraint() {
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        timeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
    }
    
    func setupPopoverButtonConstraint() {
        popoverButton.translatesAutoresizingMaskIntoConstraints = false
        popoverButton.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor, constant: 0).isActive = true
        popoverButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    }
    
    func setupToggleButtonConstraint() {
        toggleButton.translatesAutoresizingMaskIntoConstraints = false
        toggleButton.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor, constant: 0).isActive = true
        toggleButton.trailingAnchor.constraint(equalTo: popoverButton.leadingAnchor, constant: -20).isActive = true
    }
    
    func setupCellStyle() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 3
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 10).cgPath
        
    }
    
    @objc func handleButtonTapped(_ sender: UIButton) {
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
