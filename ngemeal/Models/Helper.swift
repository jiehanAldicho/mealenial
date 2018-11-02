//
//  Helper.swift
//  ngemeal
//
//  Created by Andy Jiehan Aldicho on 17/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import Foundation
import UIKit


//Main gradient color
extension CAGradientLayer {
    func primaryGradientLayer() -> CAGradientLayer {
        let greenStart = Colors.mainGradientStart.cgColor //Create color helper for this
        let blueEnd = Colors.mainGradientEnd.cgColor //Create color helper for this
        self.colors = [greenStart, blueEnd]
        self.startPoint = CGPoint(x: 0.3, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        return self
    }
    
    func buttonGradientLayer() -> CAGradientLayer {
        let yellowStart = Colors.secondaryGradientStart.cgColor //Create color helper for this
        let redEnd = Colors.secondaryGradientEnd.cgColor//Create color helper for this
        self.colors = [yellowStart, redEnd]
        self.startPoint = CGPoint(x: 0 , y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        return self
    }
    
    func menuCellGradientLayer() -> CAGradientLayer {
        let start = UIColor(displayP3Red: 251/255, green: 255/255, blue: 254/255, alpha: 1).cgColor //Create color helper for this
        let end = UIColor(displayP3Red: 245/255, green: 253/255, blue: 251/255, alpha: 1).cgColor//Create color helper for this
        self.colors = [start, end]
        self.startPoint = CGPoint(x: 0, y: -0.2)
        self.endPoint = CGPoint(x: 0, y: 1)
        return self
    }
    
    func cardBottomGradientLayer() -> CAGradientLayer {
        let start = UIColor(displayP3Red: 251/255, green: 255/255, blue: 254/255, alpha: 1).cgColor //Create color helper for this
        let end = UIColor(displayP3Red: 245/255, green: 253/255, blue: 251/255, alpha: 1).cgColor//Create color helper for this
        self.colors = [start, end]
        self.startPoint = CGPoint(x: 0, y: 0.2)
        self.endPoint = CGPoint(x: 0, y: 0.7)
        return self
    }
}

//Custom fake navigation bar
extension UIViewController {
    func addCustomNavbar(_ title: String) -> UIView {
        let fakeNavBar = UIView()
        let width = UIScreen.main.bounds.width
        fakeNavBar.frame = CGRect(x: 0, y: 0, width: width, height: 88)
        
        //Navbar gradient BG
        let gradientBG = CAGradientLayer().primaryGradientLayer()
        gradientBG.frame = fakeNavBar.frame
        fakeNavBar.layer.addSublayer(gradientBG)
        
        //Navbar shadow
//        fakeNavBar.layer.masksToBounds = false
//        fakeNavBar.layer.shadowColor = UIColor.black.cgColor
//        fakeNavBar.layer.shadowOpacity = 0.2
//        fakeNavBar.layer.shadowOffset = CGSize(width: 0, height: 2)
//        fakeNavBar.layer.shadowRadius = 2
//        fakeNavBar.layer.shadowPath = UIBezierPath(rect: fakeNavBar.bounds).cgPath
        
        let fakeNavbarLbl = UILabel()
        fakeNavbarLbl.text = title
        fakeNavbarLbl.textColor = .white
        fakeNavbarLbl.font = FontType.init(size: 28).bold
        fakeNavBar.addSubview(fakeNavbarLbl)
        
        view.addSubview(fakeNavBar)
        
        //Navbar title constraints
        fakeNavbarLbl.translatesAutoresizingMaskIntoConstraints = false
        fakeNavbarLbl.bottomAnchor.constraint(equalTo: fakeNavBar.bottomAnchor, constant: -10).isActive = true
//        fakeNavbarLbl.leadingAnchor.constraint(equalTo: fakeNavBar.leadingAnchor, constant: 20).isActive = true
        fakeNavbarLbl.centerXAnchor.constraint(equalTo: fakeNavBar.centerXAnchor).isActive = true
        return fakeNavBar
    }
    
    func setCustomNavbar() {
        self.tabBarController?.tabBar.isHidden = true
        
        let greenStart = UIColor(displayP3Red: 105/255, green: 203/255, blue: 167/255, alpha: 1) //Create color helper for this
        let blueEnd = UIColor(displayP3Red: 18/255, green: 173/255, blue: 185/255, alpha: 1) //Create color helper for this
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.setGradientBackground(colors: [greenStart,blueEnd])
        self.navigationItem.title = "Food Detail"
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Avenir", size: 20)!]
    }
}

//Add bottom border for label
extension UILabel {
    func addBottomBorder() {
        let bottomBorder = UIView()
        let frame = CGRect(x: 0, y: self.frame.height/2, width: self.frame.width+10, height: 1.5)
        bottomBorder.frame = frame
        
        let bottomBorderGradientBG = CAGradientLayer().primaryGradientLayer()
        bottomBorderGradientBG.frame = bottomBorder.frame
        bottomBorder.layer.addSublayer(bottomBorderGradientBG)
        
        self.addSubview(bottomBorder)
    }
}
