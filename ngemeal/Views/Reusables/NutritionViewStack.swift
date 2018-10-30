//
//  NutritionViewStack.swift
//  ngemeal
//
//  Created by Andy Jiehan on 24/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

//NutritioNStack v2
class NutritionStackView2: UIStackView {
    
    var vegVal: Int = 0
    var proVal: Int = 0
    var stapVal: Int = 0
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 120, height: 65))
        
        let veg = generateNutrition(Colors.veggie, "Veggie")
        let pro = generateNutrition(Colors.protein, "Protein")
        let stap = generateNutrition(Colors.staple, "Grains")
        
        self.addArrangedSubview(veg)
        self.addArrangedSubview(pro)
        self.addArrangedSubview(stap)
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.spacing = 3
    }
    
    private func generateNutrition(_ color: UIColor, _ type: String) -> UIView {
        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: 120, height: 20)
        
        let colBox = UIView()
        colBox.layer.cornerRadius = 3
        colBox.backgroundColor = color
        
        let typeLbl = UILabel()
        typeLbl.text = type
        typeLbl.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        typeLbl.font = UIFont(name: "AvenirNext-MediumItalic", size: 13)
        
        
        v.addSubview(colBox)
        v.addSubview(typeLbl)
        
        colBox.translatesAutoresizingMaskIntoConstraints = false
        colBox.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
        colBox.leadingAnchor.constraint(equalTo: v.leadingAnchor).isActive = true
        colBox.widthAnchor.constraint(equalToConstant: 14).isActive = true
        colBox.heightAnchor.constraint(equalToConstant: 14).isActive = true
        
        typeLbl.translatesAutoresizingMaskIntoConstraints = false
        typeLbl.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
        typeLbl.leadingAnchor.constraint(equalTo: colBox.trailingAnchor, constant: 7).isActive = true
        
        return v
    }
}

//
class NutritionView: UIView {
    var vegVal: Int = 0
    var proVal: Int = 0
    var stapVal: Int = 0
    
    var vegLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "0"
        lbl.textColor = Colors.textGreen
        lbl.font = UIFont(name: "Avenir-Black", size: 23)
        return lbl
    }()
    
    var proLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "0"
        lbl.textColor = Colors.textGreen
        lbl.font = UIFont(name: "Avenir-Black", size: 23)
        return lbl
    }()
    
    var stapLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "0"
        lbl.textColor = Colors.textGreen
        lbl.font = UIFont(name: "Avenir-Black", size: 23)
        return lbl
    }()
    
    convenience init(_ vegPercent: Int, _ proPercent: Int, _ stapPercent: Int) {
        self.init(frame: CGRect(x: 0, y: 0, width: 230, height: 160))
        
        self.vegVal = vegPercent
        self.proVal = proPercent
        self.stapVal = stapPercent
        
        
    }
}

//The labels are now accessible
class ChartNutritionStackView: UIStackView {
    var vegVal: Int = 0
    var proVal: Int = 0
    var stapVal: Int = 0
    
    var vegLabel: UILabel = {
        let lbl = UILabel()
<<<<<<< HEAD
=======
        lbl.text = "0%"
>>>>>>> e0f3a2e8f01f54800407963e82376624aa04719e
        lbl.textColor = Colors.textGreen
        lbl.font = UIFont(name: "Avenir-Black", size: 23)
        return lbl
    }()
    
    var proLabel: UILabel = {
        let lbl = UILabel()
<<<<<<< HEAD
=======
        lbl.text = "0%"
>>>>>>> e0f3a2e8f01f54800407963e82376624aa04719e
        lbl.textColor = Colors.textGreen
        lbl.font = UIFont(name: "Avenir-Black", size: 23)
        return lbl
    }()
    
    var stapLabel: UILabel = {
        let lbl = UILabel()
<<<<<<< HEAD
=======
        lbl.text = "0%"
>>>>>>> e0f3a2e8f01f54800407963e82376624aa04719e
        lbl.textColor = Colors.textGreen
        lbl.font = UIFont(name: "Avenir-Black", size: 23)
        return lbl
    }()
    
    var vegView: UIView!
    var proView: UIView!
    var stapView: UIView!
    
    convenience init(_ vegPercent: Int, _ proPercent: Int, _ stapPercent: Int) {
        self.init(frame: CGRect(x: 0, y: 0, width: 230, height: 160))
        
        self.vegVal = vegPercent
        self.proVal = proPercent
        self.stapVal = stapPercent
        
        vegView = generateNutrition("Veggie")
        proView = generateNutrition("Protein")
        stapView = generateNutrition("Grains")
        
        self.addArrangedSubview(vegView)
        self.addArrangedSubview(proView)
        self.addArrangedSubview(stapView)
        self.axis = .vertical
        self.distribution = .fillEqually
        self.spacing = 3
        
        self.addSubview(vegLabel)
        self.addSubview(proLabel)
        self.addSubview(stapLabel)
        
        self.vegLabel.text = "\(vegVal)%"
        self.proLabel.text = "\(proVal)%"
        self.stapLabel.text = "\(stapVal)%"
        
        setupLabelsConstraint()
    }
    
    func setupLabelsConstraint() {
        vegLabel.translatesAutoresizingMaskIntoConstraints = false
        vegLabel.centerYAnchor.constraint(equalTo: self.vegView.centerYAnchor, constant: 0).isActive = true
        vegLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
        proLabel.translatesAutoresizingMaskIntoConstraints = false
        proLabel.centerYAnchor.constraint(equalTo: self.proView.centerYAnchor, constant: 0).isActive = true
        proLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
        stapLabel.translatesAutoresizingMaskIntoConstraints = false
        stapLabel.centerYAnchor.constraint(equalTo: self.stapView.centerYAnchor, constant: 0).isActive = true
        stapLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    
    private func generateNutrition(_ type: String) -> UIView {
        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: 300, height: 30)
        
        let img = UIImage(named: type)
        let nutritionImg = UIImageView(image: img)
        
        let typeLbl = UILabel()
        typeLbl.text = type
        typeLbl.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        typeLbl.font = UIFont(name: "Avenir-Heavy", size: 23)
        
//        let percentLbl = UILabel()
//        percentLbl.text = "\(value)%"
//        percentLbl.textColor = Colors.textGreen
//        percentLbl.font = UIFont(name: "Avenir-Black", size: 23)
        
        let bottomLine = UIView()
        let gradientBG = CAGradientLayer().primaryGradientLayer()
        bottomLine.frame = CGRect(x: 0, y: 0, width: v.frame.width, height: 1)
        gradientBG.frame = CGRect(x: 0, y: 0, width: v.frame.width-20, height: 1.5)
        bottomLine.layer.addSublayer(gradientBG)
        
        v.addSubview(nutritionImg)
        v.addSubview(typeLbl)
//        v.addSubview(percentLbl)
        v.addSubview(bottomLine)
        
        nutritionImg.translatesAutoresizingMaskIntoConstraints = false
        nutritionImg.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
        nutritionImg.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 10).isActive = true
        nutritionImg.widthAnchor.constraint(equalToConstant: 30).isActive = true
        nutritionImg.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        typeLbl.translatesAutoresizingMaskIntoConstraints = false
        typeLbl.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
        typeLbl.leadingAnchor.constraint(equalTo: nutritionImg.trailingAnchor, constant: 30).isActive = true
        
//        percentLbl.translatesAutoresizingMaskIntoConstraints = false
//        percentLbl.centerYAnchor.constraint(equalTo: v.centerYAnchor, constant: 0).isActive = true
//        percentLbl.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -20).isActive = true
        
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: 0).isActive = true
        bottomLine.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
        bottomLine.widthAnchor.constraint(equalToConstant: v.frame.width - 20).isActive = true
        bottomLine.heightAnchor.constraint(equalToConstant: 1.5).isActive = true
        
        return v
    }
}

