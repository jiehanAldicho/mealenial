//
//  NextMealCell.swift
//  ngemeal
//
//  Created by Andy Jiehan Aldicho on 17/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

protocol NextMealCellDelegate {
    func takeCamera()
}

class NextMealCell: LastMealCell, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var delegate: NextMealCellDelegate?
    
    var addMealButton: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: 198, height: 56)
        btn.setTitle("Add Meal", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 18)
        btn.backgroundColor = .white
        btn.layer.borderWidth = 3
        btn.layer.borderColor = #colorLiteral(red: 0, green: 0.662745098, blue: 0.4901960784, alpha: 1)
        btn.layer.cornerRadius = btn.bounds.size.width / 8
        
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(addMealButton)
        
        setupButtonConstraint()
        self.titleLabel.text = "Your next meal"
        
        setupNutritionConstraintBtn()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addMealButton.addTarget(self, action: #selector(self.buttonCamera(_:)), for: .touchUpInside)
        
        //    addMealButton.layer.cornerRadius = addMealButton.bounds.size.width / 7
    }
    
    func setupButtonConstraint() {
        addMealButton.translatesAutoresizingMaskIntoConstraints = false
        addMealButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        addMealButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        addMealButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        addMealButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupNutritionConstraintBtn() {
        nutritionStack.translatesAutoresizingMaskIntoConstraints = false
        nutritionStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -80).isActive = true
        nutritionStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nutritionStack.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nutritionStack.widthAnchor.constraint(equalToConstant: 220).isActive = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func buttonCamera(_ sender: UIButton) {
        guard let delegate = delegate else {
            return
        }
        
        delegate.takeCamera()
    }
    
}
