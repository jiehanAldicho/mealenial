//
//  LastMealCell.swift
//  ngemeal
//
//  Created by Andy Jiehan Aldicho on 17/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class LastMealCell: UICollectionViewCell {
    
    var meal: Meal?
    
    var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Your last meal"
        lbl.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        lbl.font = UIFont(name: "Avenir-Medium", size: 18)
        return lbl
    }()
    
    
    var nutritionStack = NutritionStackView2()
    var timeStamp = TimeStampView(frame: CGRect.zero, time: Date())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellStyle()
        
        self.addSubview(titleLabel)
        self.addSubview(nutritionStack)
        self.addSubview(timeStamp)
        
        setupTitleLabelConstraint()
        setupNutritionConstraint()
        setupTimeStampConstraint()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.addBottomBorder()
        //MARK: Put updates relating to meal class here 👾
        //    nutritionStack = NutritionStackView(0, 0, 21)
        nutritionStack.proVal = 241
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//Styling and constraints
extension LastMealCell {
    func setupCellStyle() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 5
        
        //Shadow
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 2
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 5).cgPath
    }
    
    func setupTitleLabelConstraint() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
    }
    
    func setupNutritionConstraint() {
        nutritionStack.translatesAutoresizingMaskIntoConstraints = false
        nutritionStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        nutritionStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nutritionStack.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nutritionStack.widthAnchor.constraint(equalToConstant: 220).isActive = true
    }
    
    func setupTimeStampConstraint() {
        timeStamp.translatesAutoresizingMaskIntoConstraints = false
        timeStamp.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        timeStamp.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        timeStamp.widthAnchor.constraint(equalToConstant: 57).isActive = true
        timeStamp.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }
}
