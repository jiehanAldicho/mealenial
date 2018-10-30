//
//  CollectionViewCell.swift
//  ngemeal
//
//  Created by Yuvens Putra Barata on 29/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit
import MultiSlider

class AccountCollectionViewCell: UICollectionViewCell {
    
    //MARK: Variables
    
    //Title Label Variables
    var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Meal Composition"
        lbl.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        lbl.font = UIFont(name: "Avenir-Heavy", size: 28)
        lbl.lineBreakMode = .byWordWrapping
        lbl.numberOfLines = 0
        return lbl
    }()
    
    //Slider View Variables
    
    var sliderView: UIControl = {
        
        let slider   = MultiSlider()
        slider.minimumValue = 0    // default is 0.0
        slider.maximumValue = 100    // default is 1.0
        slider.snapStepSize = 1  // default is 0.0, i.e. don't snap
        
        slider.value = [50, 67]
        
        
        //        slider.addTarget(self, action: #selector(sliderDragEnded(_:)), forControlEvents: . touchUpInside) // sent when drag ends
        
        slider.orientation = .horizontal
        slider.tintColor = UIColor(displayP3Red: 11/255, green: 205/255, blue: 190/255, alpha: 1)
        slider.trackWidth = 7
        slider.hasRoundTrackEnds = true
        slider.showsThumbImageShadow = true
        
        slider.valueLabelPosition = .notAnAttribute // .NotAnAttribute = don't show labels
        slider.isValueLabelRelative = true // shows differences instead of absolute values
        
        return slider
    }()
    
    //Other Label Variables
    var otherLabel: UILabel = {
        
        let lbl = UILabel()
        lbl.text = "Your meal is composed of"
        lbl.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        lbl.font = UIFont(name: "Avenir-Oblique", size: 16)
        
        return lbl
    }()
    
    //Nutrition Variables
    var nutritionLabel = ChartNutritionStackView(50, 33, 17)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleLabel)
        self.addSubview(sliderView)
        self.addSubview(otherLabel)
        self.addSubview(nutritionLabel)
        
        sliderView.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        
    }
    
    override func layoutSubviews() {
        setupCellStyle()
        setupTitleLabel()
        setupSliderConstraint()
        setupOtherLabel()
        setupNutritionLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: Extension
extension AccountCollectionViewCell {
    //Function Setup Cell
    func setupCellStyle() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        
        //Shadow
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 2
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 8).cgPath
    }
    
    //Title Label Constraint
    func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    //Slider Function
    func setupSliderConstraint() {
        sliderView.translatesAutoresizingMaskIntoConstraints = false
        sliderView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        sliderView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 60).isActive = true
        sliderView.widthAnchor.constraint(equalToConstant: 263).isActive = true
        sliderView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    @objc func sliderChanged(slider: MultiSlider) {
        //        print("\(slider.value)")
        
        nutritionLabel.vegLabel.text = "\(Int(slider.value[0]))%"
        nutritionLabel.proLabel.text = "\(Int(slider.value[1] - slider.value[0]))%"
        nutritionLabel.stapLabel.text = "\(100 - Int(slider.value[1]))%"
        
        print("\(nutritionLabel.vegVal)")
        print("\(nutritionLabel.proVal)")
        print("\(nutritionLabel.stapVal)")
        
    }
    
    //Other Label Setup
    func setupOtherLabel() {
        otherLabel.translatesAutoresizingMaskIntoConstraints = false
        otherLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25).isActive = true
        otherLabel.topAnchor.constraint(equalTo: self.sliderView.bottomAnchor, constant: 60).isActive = true
        otherLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        otherLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    //Nutrition Label Constraint
    func setupNutritionLabel() {
        nutritionLabel.translatesAutoresizingMaskIntoConstraints = false
        nutritionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nutritionLabel.topAnchor.constraint(equalTo: self.otherLabel.bottomAnchor, constant: 20).isActive = true
        nutritionLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nutritionLabel.heightAnchor.constraint(equalToConstant: 160).isActive = true
    }
}
