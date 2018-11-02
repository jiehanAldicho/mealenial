//
//  WeekPicker.swift
//  ngemeal
//
//  Created by Andy Jiehan on 23/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class WeekPickerView: UIView {
    
    //    let dateComponents = Calendar.Component
    var startDate = Date()
    var nextDate = Calendar.current.date(byAdding: .day, value: 7, to: Date())
    
    var weekLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lbl.font = FontType(size: 25).medium
        return lbl
    }()
    
    var previousWeekButton: UIButton = {
        let btn = UIButton()
        let img = UIImage(named: "arrow-left-1")?.withRenderingMode(.alwaysTemplate)
        btn.setImage(img, for: .normal)
        btn.tintColor = .white
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageEdgeInsets = UIEdgeInsets(top: 55, left: 55, bottom: 55, right: 55)
        return btn
    }()
    
    var nextWeekButton: UIButton = {
        let btn = UIButton()
        let img = UIImage(named: "arrow-right-1")?.withRenderingMode(.alwaysTemplate)
        btn.setImage(img, for: .normal)
        btn.tintColor = .white
        btn.imageView?.contentMode = .scaleAspectFill
        btn.imageEdgeInsets = UIEdgeInsets(top: 55, left: 55, bottom: 55, right: 55)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: 343, height: 50)
        self.clipsToBounds = true
        self.layer.cornerRadius = 20
        
        //Background setups
        setupViewGradientBackground()
        
        //Adding subviews
        self.addSubview(weekLabel)
        self.addSubview(previousWeekButton)
        self.addSubview(nextWeekButton)
        
        //Constraint setups
        setWeekLabelText()
        setupWeekLabelConstraints()
        setupPrevButtonConstraints()
        setupNextButtonConstraints()
    }
    
    func setupWeekLabelConstraints() {
        weekLabel.translatesAutoresizingMaskIntoConstraints = false
        weekLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        weekLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func setWeekLabelText() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        let startDateText = formatter.string(from: startDate)
        let nextDateText = formatter.string(from: nextDate!)
        weekLabel.text = "\(startDateText) - \(nextDateText)"
    }
    
    func setupPrevButtonConstraints() {
        previousWeekButton.translatesAutoresizingMaskIntoConstraints = false
        previousWeekButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        previousWeekButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func setupNextButtonConstraints() {
        nextWeekButton.translatesAutoresizingMaskIntoConstraints = false
        nextWeekButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        nextWeekButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func setupViewGradientBackground() {
        //Setup gradient color
        let gradientBG = CAGradientLayer()
        let startCol = UIColor(displayP3Red: 245/255, green: 219803/255, blue: 35/255, alpha: 1).cgColor
        let endCol = UIColor(displayP3Red: 245/255, green: 134/255, blue: 99/255, alpha: 1).cgColor
        gradientBG.colors = [startCol, endCol]
        gradientBG.startPoint = CGPoint(x: -1, y: 0)
        gradientBG.endPoint = CGPoint(x: 1, y: 0)
        
        //Navbar gradient BG
        gradientBG.frame = self.frame
        gradientBG.cornerRadius = 20
        self.layer.addSublayer(gradientBG)
        
        //Adding shadow
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 2
        //        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 20).cgPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
