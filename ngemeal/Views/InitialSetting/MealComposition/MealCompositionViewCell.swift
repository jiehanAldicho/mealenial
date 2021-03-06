//
//  MealCompositionCollectionViewCell.swift
//  ngemeal
//
//  Created by Yuvens Putra Barata on 25/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//
import UIKit
import MultiSlider
import MiniLayout
//Delegate Button
protocol MealCompositionCollectionViewCellDelegate {
    func pushNext()
}
class MealCompositionCollectionViewCell: UICollectionViewCell {
    
    //Delegate
    var delegate: MealCompositionCollectionViewCellDelegate?
    
    //Container Variables
    
    var vegValue = Int()
    var protValue = Int()
    var stapValue = Int()
    
    //Title Label Variables
    var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Setup your ideal meal composition"
        lbl.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        lbl.font = UIFont(name: "TTNorms-Bold", size: 28)
        lbl.lineBreakMode = .byWordWrapping
        lbl.numberOfLines = 0
        return lbl
    }()
    
    //Slider View Variables
    
    var sliderView: UIControl = {
        
        let slider = MultiSlider()
        slider.minimumValue = 0    // default is 0.0
        slider.maximumValue = 100    // default is 1.0
        slider.snapStepSize = 1  // default is 0.0, i.e. don't snap
        
        slider.value = [50,67]
        
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
        lbl.font = UIFont(name: "TTNorms-Italic", size: 16)
        
        return lbl
    }()
    
    //Nutrition Variables
    var nutritionLabel = ChartNutritionStackView(50, 33, 17)
    
    //Other Label2 Variables
    var otherLabel2: UILabel = {
        
        let lbl = UILabel()
        lbl.text = "The ideal plate according to USDA consists of 50% veggies and fruits, 17% proteins, and 33% grains."
        lbl.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        lbl.font = UIFont(name: "TTNorms-Italic", size: 14)
        lbl.lineBreakMode = .byWordWrapping
        lbl.numberOfLines = 0
        
        return lbl
    }()
    
    //Save Button Variables
    var saveMealButton: UIButton = {
        
        let btn = UIButton()
        
        btn.frame = CGRect(x: 0, y: 0, width: 198, height: 56)
        
        btn.setTitle("Done!", for: .normal)
        //        btn.setTitleColor(#colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont(name: "TTNorms-Bold", size: 20)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = btn.bounds.size.width / 8
        btn.backgroundColor = UIColor(displayP3Red: 255/255, green: 160/255, blue: 71/255, alpha: 1)
        
        //Shadow
        btn.layer.masksToBounds = false
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.1
        btn.layer.shadowOffset = CGSize(width: 0, height: 1)
        btn.layer.shadowRadius = 2
        
        return btn
    }()
    
    //Reset Button
    var resetButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("", for: .normal)
        //        btn.backgroundColor = UIColor(displayP3Red: 255/255, green: 160/255, blue: 71/255, alpha: 1)
        return btn
    }()
    
    var resetImage = UIImageView(image: UIImage(named: "Artboard"))
    
    //Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleLabel)
        self.addSubview(sliderView)
        self.addSubview(otherLabel)
        self.addSubview(nutritionLabel)
        self.addSubview(otherLabel2)
        self.addSubview(resetButton)
        resetButton.addSubview(resetImage)
        self.addSubview(saveMealButton)
        
        sliderView.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        saveMealButton.addTarget(self, action: #selector(pushButton), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        setupCellStyle()
        setupTitleLabel()
        setupSliderConstraint()
        setupOtherLabel()
        setupResetButton()
        setupNutritionLabel()
        setupOtherLabel2()
        setupButtonConstraint()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Delegate Button
    @IBAction func pushButton(sender: UIButton) {
        
        guard let delegate = delegate else {
            return
        }
        
        delegate.pushNext()
    }
    
}
//MARK: Extension
extension MealCompositionCollectionViewCell {
    //Function Setup Cell
    func setupCellStyle() {
//        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        
        //Shadow
//        self.layer.masksToBounds = false
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOpacity = 0.1
//        self.layer.shadowOffset = CGSize(width: 0, height: 1)
//        self.layer.shadowRadius = 2
//        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
//        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 8).cgPath
    }
    
    //Title Label Constraint
    func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.nutritionLabel.leadingAnchor, constant: 0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    //Slider Function
    func setupSliderConstraint() {
        sliderView.translatesAutoresizingMaskIntoConstraints = false
        sliderView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
//        sliderView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        sliderView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 60).isActive = true
        sliderView.widthAnchor.constraint(equalToConstant: 284).isActive = true
        sliderView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    @objc func sliderChanged(slider: MultiSlider) {
        nutritionLabel.vegLabel.text = "\(Int(slider.value[0]))%"
        nutritionLabel.proLabel.text = "\(Int(slider.value[1] - slider.value[0]))%"
        nutritionLabel.stapLabel.text = "\(100 - Int(slider.value[1]))%"
        
        vegValue = Int(slider.value[0])
        protValue = Int(slider.value[1] - slider.value[0])
        stapValue = 100 - Int(slider.value[1])
    }
    
    //Other Label Setup
    func setupOtherLabel() {
        otherLabel.translatesAutoresizingMaskIntoConstraints = false
        otherLabel.leadingAnchor.constraint(equalTo: self.nutritionLabel.leadingAnchor, constant: -4).isActive = true
        otherLabel.topAnchor.constraint(equalTo: self.sliderView.bottomAnchor, constant: 60).isActive = true
        otherLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        otherLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    //Reset Button Setup
    func setupResetButton() {
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        resetButton.topAnchor.constraint(equalTo: self.sliderView.bottomAnchor, constant: 60).isActive = true
        resetButton.widthAnchor.constraint(equalToConstant: 26).isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: 26).isActive = true
    }
    
    @objc func reset() {
        
        var slider = sliderView as! MultiSlider
        
        slider.value = [50,67]
        
        nutritionLabel.vegLabel.text = "\(Int(slider.value[0]))%"
        nutritionLabel.proLabel.text = "\(Int(slider.value[1] - slider.value[0]))%"
        nutritionLabel.stapLabel.text = "\(100 - Int(slider.value[1]))%"
        
        vegValue = Int(slider.value[0])
        protValue = Int(slider.value[1] - slider.value[0])
        stapValue = 100 - Int(slider.value[1])
    }
    
    //Nutrition Label Constraint
    func setupNutritionLabel() {
        nutritionLabel.translatesAutoresizingMaskIntoConstraints = false
//        nutritionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        nutritionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nutritionLabel.topAnchor.constraint(equalTo: self.otherLabel.bottomAnchor, constant: 20).isActive = true
        nutritionLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nutritionLabel.heightAnchor.constraint(equalToConstant: 160).isActive = true
    }
    
    //Other Label 2 Setup
    func setupOtherLabel2() {
        otherLabel2.translatesAutoresizingMaskIntoConstraints = false
        otherLabel2.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        otherLabel2.topAnchor.constraint(equalTo: self.nutritionLabel.bottomAnchor, constant: 20).isActive = true
        otherLabel2.widthAnchor.constraint(equalToConstant: 300).isActive = true
        otherLabel2.heightAnchor.constraint(equalToConstant: 68).isActive = true
    }
    
    //Save Button Setup
    func setupButtonConstraint() {
        saveMealButton.translatesAutoresizingMaskIntoConstraints = false
        saveMealButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        saveMealButton.topAnchor.constraint(equalTo: self.otherLabel2.bottomAnchor, constant: 30).isActive = true
        saveMealButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        saveMealButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
