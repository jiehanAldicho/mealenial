//
//  IntroViewController.swift
//  ngemeal
//
//  Created by Yuvens Putra Barata on 02/11/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    
    var introPage = UIImageView(image: UIImage(named: "Introduction"))
    
    var nextButton: UIButton = {
        let btn = UIButton()
        
        btn.frame = CGRect(x: 0, y: 0, width: 198, height: 56)
        
        btn.setTitle("Okay!", for: .normal)
        //        btn.setTitleColor(#colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont(name: "Avenir-Black", size: 20)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = btn.bounds.size.width / 8
        btn.backgroundColor = UIColor(displayP3Red: 255/255, green: 160/255, blue: 71/255, alpha: 1)
        
        //Shadow
        btn.layer.masksToBounds = false
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowOffset = CGSize(width: 1, height: 1)
        btn.layer.shadowRadius = 2
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(introPage)
        self.view.addSubview(nextButton)
        
        setupIntro()
        setupButton()
        
        nextButton.addTarget(self, action: #selector(nextPushed), for: .touchUpInside)
    }
    
}

//MARK: Extension Function

extension IntroViewController {
    func setupIntro() {
        introPage.translatesAutoresizingMaskIntoConstraints = false
        introPage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        introPage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        introPage.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        introPage.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
    }
    
    func setupButton() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func nextPushed() {
        let mealCompositionVC = MealCompositionViewController()
        self.navigationController?.pushViewController(mealCompositionVC, animated: true)
    }
}
