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
        lbl.textColor = #colorLiteral(red: 1, green: 0.6274509804, blue: 0.2784313725, alpha: 1)
        lbl.font = FontType(size: 35).bold
        return lbl
    }()
    
    let toggleButton: UISwitch = {
        let swtch = UISwitch()
        swtch.setOn(true, animated: true)
        swtch.onTintColor = #colorLiteral(red: 1, green: 0.6274509804, blue: 0.2784313725, alpha: 1)
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
        lbl.textColor = #colorLiteral(red: 1, green: 0.6274509804, blue: 0.2784313725, alpha: 1)
        lbl.font = UIFont(name: "TTNorms-Regular", size: 18)
        return lbl
    }()
    
    var daysCollectionView: UICollectionView!
    var days = ["S", "M", "T", "W", "T", "F", "S"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.backgroundColor
        setupCellStyle()
        
        popoverButton = MoreOptionButton.init(frame: CGRect.zero)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        daysCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        daysCollectionView.dataSource = self
        daysCollectionView.delegate = self
        daysCollectionView.backgroundColor = .clear
        daysCollectionView.register(DayCell.self, forCellWithReuseIdentifier: "dayCell")
        
        
        self.addSubview(bottomView)
        bottomView.addSubview(mealTypeLabel)
        bottomView.addSubview(daysCollectionView)
        self.addSubview(timeLabel)
        self.addSubview(toggleButton)
        self.addSubview(popoverButton)
        
        setupTimeLabelConstraint()
        setupPopoverButtonConstraint()
        setupToggleButtonConstraint()
        setupBottomViewConstraint()
        setupMealTypeLabelConstraint()
        setupDaysConstraint()
        
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
    
    func setupDaysConstraint() {
        daysCollectionView.translatesAutoresizingMaskIntoConstraints = false
        daysCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        daysCollectionView.centerYAnchor.constraint(equalTo: mealTypeLabel.centerYAnchor).isActive = true
        daysCollectionView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        daysCollectionView.heightAnchor.constraint(equalToConstant: 20).isActive = true
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

extension ScheduleCollectionViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayCell", for: indexPath) as! DayCell
        cell.dayLabel.text = days[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 10, height: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! DayCell
        cell.dayLabel.textColor = #colorLiteral(red: 1, green: 0.6274509804, blue: 0.2784313725, alpha: 1)
        cell.dayLabel.font = FontType(size: 15).bold
    }
}

class DayCell: UICollectionViewCell {
    var dayLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = FontType(size: 15).regular
        lbl.textColor = Colors.textBlack
        return lbl
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(dayLabel)
        setupLabelConstraint()
    }
    
    func setupLabelConstraint() {
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        dayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
