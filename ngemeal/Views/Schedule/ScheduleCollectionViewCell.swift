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
    
    var bottomView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.clear
        return v
    }()
    
    var popoverButton = MoreOptionButton()
    
    var mealTypeLabel: UILabel = {
        let lbl = UILabel()
        let attributes = [NSAttributedString.Key.ligature: 0]
        var title = NSAttributedString(string: "Breakfast", attributes: attributes)
        lbl.attributedText = title
        lbl.textColor = Colors.textBlack
        lbl.font = UIFont(name: "Avenir", size: 18)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.backgroundColor
        setupCellStyle()
        
        popoverButton = MoreOptionButton.init(frame: CGRect.zero)
        
        self.addSubview(bottomView)
        bottomView.addSubview(mealTypeLabel)
        self.addSubview(timeLabel)
        self.addSubview(toggleButton)
        self.addSubview(popoverButton)
        
        setupTimeLabelConstraint()
        setupPopoverButtonConstraint()
        setupToggleButtonConstraint()
        setupBottomViewConstraint()
        setupMealTypeLabelConstraint()
        
        popoverButton.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        
    }
    
    func setupTimeLabelConstraint() {
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        timeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
    }
    
    func setupPopoverButtonConstraint() {
        popoverButton.translatesAutoresizingMaskIntoConstraints = false
        popoverButton.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor, constant: 0).isActive = true
        popoverButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        popoverButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        popoverButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupToggleButtonConstraint() {
        toggleButton.translatesAutoresizingMaskIntoConstraints = false
        toggleButton.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor, constant: 0).isActive = true
        toggleButton.trailingAnchor.constraint(equalTo: popoverButton.leadingAnchor, constant: -10).isActive = true
    }
    
    func setupBottomViewConstraint() {
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        bottomView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: self.frame.height * 0.45).isActive = true
        
        bottomView.layer.cornerRadius = 10
        bottomView.clipsToBounds = true
        bottomView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        let gradientBG = CAGradientLayer().cardBottomGradientLayer()
        gradientBG.frame = bottomView.bounds
        bottomView.layer.addSublayer(gradientBG)
        
        let topBorder = UIView()
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 1)
        topBorder.frame = frame
        topBorder.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.9647058824, blue: 0.9529411765, alpha: 1)
        bottomView.addSubview(topBorder)
    }
    
    func setupMealTypeLabelConstraint() {
        mealTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        mealTypeLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        mealTypeLabel.leadingAnchor.constraint(equalTo: timeLabel.leadingAnchor).isActive = true
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
