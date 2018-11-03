//
//  IntroViewController.swift
//  ngemeal
//
//  Created by Yuvens Putra Barata on 02/11/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    
    let gradientBG = CAGradientLayer()
    var gradientSet = [[CGColor]]()
    var currentGradient = 0
    let greenStart = Colors.mainGradientStart.cgColor
    let blueEnd = Colors.mainGradientEnd.cgColor
    
    var logoImageView: UIImageView = {
        let logoImg = UIImage(named: "Logo")
        let imgv = UIImageView(image: logoImg)
        return imgv
    }()
    
    let welcomeLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Welcome, "
        lbl.textColor = .white
        lbl.font = FontType.init(size: 30).bold
        return lbl
    }()
    
    let nameInput: UITextField = {
        let textField = UITextField()
        let attributes = [NSAttributedString.Key.ligature: 0]
        var title = NSAttributedString(string: "Guest!", attributes: attributes)
        textField.attributedPlaceholder = title
        textField.textColor = UIColor.white
        textField.font = FontType.init(size: 30).bold
        return textField
    }()
    
    let firstLabel: UILabel = {
        let lbl = UILabel()
        let attributes = [NSAttributedString.Key.ligature: 0]
        var title = NSAttributedString(string: "We are ready to assist you with your meal schedule", attributes: attributes)
        lbl.attributedText = title
        lbl.textAlignment = .left
        lbl.textColor = .white
        lbl.font = FontType.init(size: 20).regular
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    let secondLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Keeping you organized, informed, and healthy"
        lbl.textAlignment = .left
        lbl.textColor = .white
        lbl.font = FontType.init(size: 20).regular
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    let thirdLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Please tell us more about your ideal meal composition"
        lbl.textAlignment = .left
        lbl.textColor = .white
        lbl.font = FontType.init(size: 20).regular
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    var nextButton: UIButton = {
        let btn = UIButton()
        
        btn.frame = CGRect(x: 0, y: 0, width: 198, height: 56)
        
        btn.setTitle("Okay!", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Avenir-Black", size: 20)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = btn.bounds.size.width / 8
        btn.backgroundColor = UIColor(displayP3Red: 255/255, green: 160/255, blue: 71/255, alpha: 1)
        
        //Shadow
        btn.layer.masksToBounds = false
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.2
        btn.layer.shadowOffset = CGSize(width: 0, height: 1)
        btn.layer.shadowRadius = 2
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameInput.delegate = self
        nameInput.addTarget(self, action: #selector(handleTextEdit), for: .editingDidEnd)

//        self.view.addSubview(introPage)
        self.view.addSubview(nextButton)
        self.view.addSubview(logoImageView)
        self.view.addSubview(welcomeLabel)
        self.view.addSubview(nameInput)
        self.view.addSubview(firstLabel)
        self.view.addSubview(secondLabel)
        self.view.addSubview(thirdLabel)
        
//        setupIntro()
        setupButton()
        setupLogoConstraint()
        setupLabelConstraints()
        
        nextButton.addTarget(self, action: #selector(nextPushed), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        gradientSet.append([greenStart, blueEnd])
        gradientSet.append([blueEnd, greenStart])
//        gradientSet.append([greenStart, test])
        
        gradientBG.frame = self.view.bounds
        gradientBG.colors = gradientSet[currentGradient]
        gradientBG.startPoint = CGPoint(x: 0.4, y: 0.0)
        gradientBG.endPoint = CGPoint(x: 0.6, y: 1.0)
        gradientBG.drawsAsynchronously = true
        self.view.layer.insertSublayer(gradientBG, at: 0)
        
        animateGradient()
    }
    
    func animateGradient() {
        if currentGradient < gradientSet.count - 1 {
            currentGradient += 1
        } else {
            currentGradient = 0
        }
        
        let gradientAnimation = CABasicAnimation(keyPath: "colors")
        gradientAnimation.duration = 3.0
        gradientAnimation.toValue = gradientSet[currentGradient]
        gradientAnimation.fillMode = CAMediaTimingFillMode.forwards
        gradientAnimation.isRemovedOnCompletion = false
        gradientAnimation.autoreverses = true
        gradientAnimation.repeatCount = Float.infinity
        gradientBG.add(gradientAnimation, forKey: "colorChange")
        
        let startPointAnimation = CABasicAnimation(keyPath: "startPoint")
        startPointAnimation.fromValue = [0.4, 0.0]
        startPointAnimation.toValue = [0.6, 0.4]
        startPointAnimation.duration = 5.0
        startPointAnimation.autoreverses = true
        startPointAnimation.repeatCount = Float.infinity
        gradientBG.add(startPointAnimation, forKey: "startPoint")

//        let endPointAnimation = CABasicAnimation(keyPath: "endPoint")
//        endPointAnimation.fromValue = [0.6, 1.0]
//        endPointAnimation.toValue = [0.6, 1.0]
//        endPointAnimation.duration = 5.0
//        endPointAnimation.autoreverses = true
//        endPointAnimation.repeatCount = Float.infinity
//        gradientBG.add(endPointAnimation, forKey: "endPoint")
    }
    
}

//MARK: Extension Function

extension IntroViewController {
//    func setupIntro() {
//        introPage.translatesAutoresizingMaskIntoConstraints = false
//        introPage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        introPage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//        introPage.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
//        introPage.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
//    }
    
    func setupButton() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupLogoConstraint() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupLabelConstraints() {
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 60).isActive = true
        
        nameInput.translatesAutoresizingMaskIntoConstraints = false
        nameInput.centerYAnchor.constraint(equalTo: welcomeLabel.centerYAnchor).isActive = true
        nameInput.leadingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor, constant: 3).isActive = true
        
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor, constant: 10).isActive = true
        firstLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 40).isActive = true
        firstLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.leadingAnchor.constraint(equalTo: firstLabel.leadingAnchor, constant: 0).isActive = true
        secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 30).isActive = true
        secondLabel.trailingAnchor.constraint(equalTo: firstLabel.trailingAnchor).isActive = true
        
        thirdLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdLabel.leadingAnchor.constraint(equalTo: firstLabel.leadingAnchor, constant: 0).isActive = true
        thirdLabel.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 30).isActive = true
        thirdLabel.trailingAnchor.constraint(equalTo: firstLabel.trailingAnchor).isActive = true
    }
    
    @objc func nextPushed() {
        let mealCompositionVC = MealCompositionViewController()
        self.navigationController?.pushViewController(mealCompositionVC, animated: true)
    }
}

extension IntroViewController: CAAnimationDelegate, UITextFieldDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            gradientBG.colors = gradientSet[currentGradient]
            animateGradient()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    @objc func handleTextEdit() {
        nameInput.text! += "!"
    }
}
