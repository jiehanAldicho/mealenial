//
//  MealScheduleCell.swift
//  ngemeal
//
//  Created by Andy Jiehan on 30/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class MealScheduleCell: UITableViewCell, UITextFieldDelegate {
    
    let mealTitleLabel: UITextField = {
        let textf = UITextField()
        textf.text = "Meal 1"
        textf.placeholder = "Add meal"
        textf.textColor = Colors.textBlack
        textf.font = FontType(size: 20).bold
        return textf
    }()
    
    var timeLabel: UITextField = {
        let lbl = UITextField()
        lbl.textColor = Colors.textGreen
        lbl.text = "00:00"
        lbl.placeholder = "Set time"
        lbl.font = FontType(size: 20).bold
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
        
        //Delegation for return button
        mealTitleLabel.delegate = self
        timeLabel.delegate = self
        
        //Adding bottom separator border
        let bottomBorder = UIView()
        let frame = CGRect(x: 0, y: self.frame.height+5, width: self.frame.width, height: 1.5)
        bottomBorder.frame = frame
        bottomBorder.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.9647058824, blue: 0.9529411765, alpha: 1)
        
        self.addSubview(bottomBorder)
        
        editButton.addTarget(self, action: #selector(highlightTextField), for: .touchUpInside)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return true
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
    
    @objc func highlightTextField() {
        mealTitleLabel.text = ""
        timeLabel.text = ""
//        if isChoosen == true {
//            isChoosen = !isChoosen
//            let btnImg = UIImage(named: "Edit")?.withRenderingMode(.alwaysTemplate)
//            editButton.setImage(btnImg, for: .normal)
//        } else {
//            isChoosen = !isChoosen
//            let img = UIImage(named: "Delete")?.withRenderingMode(.alwaysTemplate)
//            editButton.setImage(img, for: .normal)
//        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
