//
//  CollectionViewCell.swift
//  ngemeal
//
//  Created by Yuvens Putra Barata on 29/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit
import MultiSlider

protocol MealScheduleDelegate {
    func navigateToMealSchedule()
}

class AccountCollectionViewCell: UICollectionViewCell {
    
    //MARK: Variables
    
    var delegate: MealScheduleDelegate?
    
    //Title Label Variables
    var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Meal Composition"
//        lbl.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        lbl.font = UIFont(name: "Avenir-Heavy", size: 20)
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
    
    //Line 1 Variables
    var line1: UIView = {
        let line = UIView()
        
        line.backgroundColor = UIColor(displayP3Red: 229/255, green: 246/255, blue: 243/255, alpha: 1)
        
        return line
    }()
    
    //Meal Schedule Button
    var mealScheduleButton: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("", for: .normal)
//        btn.backgroundColor = UIColor(displayP3Red: 255/255, green: 160/255, blue: 71/255, alpha: 1)
        
        return btn
    }()
    
    var scheduleLabel: UILabel = {
        let lbl = UILabel()
        
        lbl.text = "Meal Schedule"
        lbl.font = UIFont(name: "Avenir-Heavy", size: 20)
        
        return lbl
    }()
    
    var arrowImage = UIImageView(image: UIImage(named: "icons-chevron-right"))
    
    //Line 2 Variables
    var line2: UIView = {
        let line = UIView()
        
        line.backgroundColor = UIColor(displayP3Red: 229/255, green: 246/255, blue: 243/255, alpha: 1)
        
        return line
    }()
    
    //Sign Out Button
    var signOutButton: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("", for: .normal)
//        btn.backgroundColor = UIColor(displayP3Red: 100/255, green: 160/255, blue: 71/255, alpha: 1)
        
        return btn
    }()
    
    var signOutLabel: UILabel = {
        let lbl = UILabel()
        
        lbl.text = "Sign Out"
        lbl.font = UIFont(name: "Avenir-Heavy", size: 20)
        
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleLabel)
        self.addSubview(sliderView)
        self.addSubview(otherLabel)
        self.addSubview(nutritionLabel)
        self.addSubview(line1)
        self.addSubview(mealScheduleButton)
        mealScheduleButton.addSubview(scheduleLabel)
        mealScheduleButton.addSubview(arrowImage)
        self.addSubview(line2)
        self.addSubview(signOutButton)
        signOutButton.addSubview(signOutLabel)
        
        mealScheduleButton.addTarget(self, action: #selector(scheduleButtonPressed), for: .touchUpInside)
        signOutButton.addTarget(self, action: #selector(signOutButtonPressed), for: .touchUpInside)
        sliderView.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
    }
    
    override func layoutSubviews() {
        setupCellStyle()
        setupTitleLabel()
        setupSliderConstraint()
        setupOtherLabel()
        setupNutritionLabel()
        setupLine1()
        setupMealScheduleButton()
        setupMealScheduleLabel()
        setupArrowConstraint()
        setupLine2()
        setupSignOutButton()
        setupSignOutLabel()
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
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
    }
    
    //Slider Function
    func setupSliderConstraint() {
        sliderView.translatesAutoresizingMaskIntoConstraints = false
        sliderView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        sliderView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20).isActive = true
        sliderView.widthAnchor.constraint(equalToConstant: 280).isActive = true
        sliderView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    @objc func sliderChanged(slider: MultiSlider) {
        //        print("\(slider.value)")
        
        nutritionLabel.vegLabel.text = "\(Int(slider.value[0]))%"
        nutritionLabel.proLabel.text = "\(Int(slider.value[1] - slider.value[0]))%"
        nutritionLabel.stapLabel.text = "\(100 - Int(slider.value[1]))%"
        
        var vegValue = Int(slider.value[0])
        var proValue = Int(slider.value[1] - slider.value[0])
        var stapValue = 100 - Int(slider.value[1])
        
        print("\(nutritionLabel.vegVal)")
        print("\(nutritionLabel.proVal)")
        print("\(nutritionLabel.stapVal)")
        
    }
    
    //Other Label Setup
    func setupOtherLabel() {
        otherLabel.translatesAutoresizingMaskIntoConstraints = false
        otherLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        otherLabel.topAnchor.constraint(equalTo: self.sliderView.bottomAnchor, constant: 40).isActive = true
    }
    
    //Nutrition Label Constraint
    func setupNutritionLabel() {
        nutritionLabel.translatesAutoresizingMaskIntoConstraints = false
        nutritionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nutritionLabel.topAnchor.constraint(equalTo: self.otherLabel.bottomAnchor, constant: 20).isActive = true
        nutritionLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nutritionLabel.heightAnchor.constraint(equalToConstant: 160).isActive = true
    }
    
    //Line 1 Constraint
    func setupLine1() {
        line1.translatesAutoresizingMaskIntoConstraints = false
        line1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        line1.topAnchor.constraint(equalTo: self.nutritionLabel.bottomAnchor, constant: 40).isActive = true
        line1.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        line1.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    //Meal Schedule Button Constraint
    func setupMealScheduleButton() {
        mealScheduleButton.translatesAutoresizingMaskIntoConstraints = false
        mealScheduleButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mealScheduleButton.topAnchor.constraint(equalTo: self.line1.bottomAnchor).isActive = true
        mealScheduleButton.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        mealScheduleButton.heightAnchor.constraint(equalToConstant: 72).isActive = true
    }
    
    func setupMealScheduleLabel() {
        scheduleLabel.translatesAutoresizingMaskIntoConstraints = false
        scheduleLabel.leadingAnchor.constraint(equalTo: mealScheduleButton.leadingAnchor, constant: 30).isActive = true
        scheduleLabel.topAnchor.constraint(equalTo: mealScheduleButton.topAnchor, constant: 22).isActive = true
        scheduleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        scheduleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupArrowConstraint() {
        arrowImage.translatesAutoresizingMaskIntoConstraints = false
        arrowImage.trailingAnchor.constraint(equalTo: mealScheduleButton.trailingAnchor, constant: -20).isActive = true
        arrowImage.topAnchor.constraint(equalTo: mealScheduleButton.topAnchor, constant: 32).isActive = true
        arrowImage.widthAnchor.constraint(equalToConstant: 10).isActive = true
        arrowImage.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    
    //Line 2 Constraint
    func setupLine2() {
        line2.translatesAutoresizingMaskIntoConstraints = false
        line2.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        line2.topAnchor.constraint(equalTo: mealScheduleButton.bottomAnchor).isActive = true
        line2.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        line2.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    //Sign Out Button Constraint
    func setupSignOutButton() {
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        signOutButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        signOutButton.topAnchor.constraint(equalTo: self.line2.bottomAnchor).isActive = true
        signOutButton.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        signOutButton.heightAnchor.constraint(equalToConstant: 72).isActive = true
    }
    
    func setupSignOutLabel() {
        signOutLabel.translatesAutoresizingMaskIntoConstraints = false
        signOutLabel.leadingAnchor.constraint(equalTo: signOutButton.leadingAnchor, constant: 30).isActive = true
        signOutLabel.topAnchor.constraint(equalTo: signOutButton.topAnchor, constant: 22).isActive = true
        signOutLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        signOutLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}

//Button Pressed Function
extension AccountCollectionViewCell {
    @objc func scheduleButtonPressed() {
        guard let delegate = delegate else { return }
        delegate.navigateToMealSchedule()
    }
    
    @objc func signOutButtonPressed() {
        print("Sign Out")
    }
}
