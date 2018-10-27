//
//  FoodDetailCell.swift
//  ngemeal
//
//  Created by Andy Jiehan on 25/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class FoodDetailCell: UICollectionViewCell {
    
    var receivedImg: UIImage = UIImage(named: "makanan")!
    
    var mealTypeLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Breakfast"
        lbl.font = UIFont(name: "Avenir-Black", size: 30)
        lbl.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        return lbl
    }()
    
    var foodImage: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Your meal is composed of"
        lbl.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        lbl.font = UIFont(name: "Avenir-Oblique", size: 16)
        return lbl
    }()
    
    var timeStamp = TimeStampView(frame: CGRect.zero, time: Date())
    
    var nutritionStack = ChartNutritionStackView(20, 30, 50)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(foodImage)
        self.addSubview(timeStamp)
        self.addSubview(descriptionLabel)
        self.addSubview(mealTypeLabel)
        self.addSubview(nutritionStack)
        
        setupCellStyle()
        setupLabelConstraint()
        setupImageConstraint()
        setupDesctriptionLabelConstraint()
        
    }
    
    override func layoutSubviews() {
        setupImageConstraint()
        setupNutritionStackConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    }

    func setupImageConstraint() {
        foodImage.clipsToBounds = true
        foodImage.contentMode = .scaleAspectFill
        foodImage.layer.cornerRadius = 10
        
        foodImage.image = receivedImg
        foodImage.translatesAutoresizingMaskIntoConstraints = false
        foodImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        foodImage.topAnchor.constraint(equalTo: self.mealTypeLabel.bottomAnchor, constant: 10).isActive = true
        foodImage.widthAnchor.constraint(equalToConstant: 213).isActive = true
        foodImage.heightAnchor.constraint(equalToConstant: 246).isActive = true
        
        timeStamp.translatesAutoresizingMaskIntoConstraints = false
        timeStamp.trailingAnchor.constraint(equalTo: foodImage.trailingAnchor, constant: -10).isActive = true
        timeStamp.bottomAnchor.constraint(equalTo: foodImage.bottomAnchor, constant: -20).isActive = true
        timeStamp.widthAnchor.constraint(equalToConstant: 57).isActive = true
        timeStamp.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }
    
    func setupLabelConstraint() {
        mealTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        mealTypeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mealTypeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
    }
    
    func setupDesctriptionLabelConstraint() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: foodImage.bottomAnchor, constant: 25).isActive = true
    }
    
    func setupNutritionStackConstraint() {
        nutritionStack.translatesAutoresizingMaskIntoConstraints = false
        nutritionStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nutritionStack.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        nutritionStack.heightAnchor.constraint(equalToConstant: 160).isActive = true
        nutritionStack.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
}
