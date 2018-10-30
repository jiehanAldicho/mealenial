//
//  MealScheduleCell.swift
//  ngemeal
//
//  Created by Andy Jiehan on 30/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class MealScheduleCell: UITableViewCell {
    var mealTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Meal 1"
        lbl.textColor = Colors.textBlack
        lbl.font = UIFont(name: "Avenir-Black", size: 20)
        return lbl
    }()
    
    var timeLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = Colors.textGreen
        lbl.text = "00:00"
        lbl.font = UIFont(name: "Avenir-Black", size: 20)
        return lbl
    }()
    
    var editButton: UIButton = {
        let btn = UIButton()
        let btnImg = UIImage(named: "Edit")?.withRenderingMode(.alwaysTemplate)
        btn.tintColor = Colors.mainOrange
        btn.setImage(btnImg, for: .normal)
        return btn
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        self.addSubview(mealTitleLabel)
        self.addSubview(editButton)
        self.addSubview(timeLabel)
        
        setupMealTitleConstraint()
        setupButtonConstraint()
        setupTimeLabelConstraint()
        
        //Adding bottom separator border
        let bottomBorder = UIView()
        let frame = CGRect(x: 0, y: self.frame.height, width: self.frame.width+10, height: 1.5)
        bottomBorder.frame = frame
        bottomBorder.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.9647058824, blue: 0.9529411765, alpha: 1)
        
        self.addSubview(bottomBorder)
    }
    
    func setupMealTitleConstraint() {
        mealTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        mealTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        mealTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    }
    
    func setupTimeLabelConstraint() {
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        timeLabel.trailingAnchor.constraint(equalTo: editButton.leadingAnchor, constant: -20).isActive = true
    }
    
    func setupButtonConstraint() {
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        editButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        editButton.widthAnchor.constraint(equalToConstant: 23).isActive = true
        editButton.heightAnchor.constraint(equalToConstant: 23).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
