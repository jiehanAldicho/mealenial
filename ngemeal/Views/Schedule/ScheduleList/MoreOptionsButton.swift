//
//  EditPopupViewController.swift
//  ngemeal
//
//  Created by Andy Jiehan on 25/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit


class MoreOptionButton: UIButton {
    
    var optView = OptionsView()
    
    var height = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let editImg = UIImage(named: "more")?.withRenderingMode(.alwaysTemplate)
        self.setImage(editImg, for: .normal)
        self.tintColor = Colors.mainOrange
//        self.setBackgroundImage(editImg, for: .normal)
//        self.imageView?.image = editImg
        
        
        optView = OptionsView.init(frame: CGRect.zero)
    }
    
    override func didMoveToSuperview() {
        print("🍤", self.superview)
        if let spView = self.superview{
            spView.addSubview(optView)
            spView.bringSubviewToFront(optView)
            
            
            optView.translatesAutoresizingMaskIntoConstraints = false
            optView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            optView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
            optView.widthAnchor.constraint(equalToConstant: 135).isActive = true
            height = optView.heightAnchor.constraint(equalToConstant: 0)
        } else {
            return
        }
    }
    
//    override func willMove(toSuperview newSuperview: UIView?) {
//        optView.translatesAutoresizingMaskIntoConstraints = false
//        optView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = false
//        optView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = false
//        optView.widthAnchor.constraint(equalToConstant: 135).isActive = false
//    }
    
//    override func layoutSubviews() {
//        self.superview?.addSubview(optView)
//        self.superview?.bringSubviewToFront(optView)
//
//        optView.translatesAutoresizingMaskIntoConstraints = false
//        optView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        optView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
//        optView.widthAnchor.constraint(equalToConstant: 135).isActive = true
//        height = optView.heightAnchor.constraint(equalToConstant: 0)
//    }
    
    var menuIsOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if menuIsOpen == false {
            
            menuIsOpen = true
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 88
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: .curveEaseIn, animations: {
                self.optView.layoutIfNeeded()
                self.optView.center.y += self.optView.frame.height / 2
            }, completion: nil)
        } else {
            menuIsOpen = false
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.optView.center.y -= self.optView.frame.height / 2
                self.optView.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class OptionsView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var menus = ["Edit", "Delete"]
    var tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuCell.self, forCellReuseIdentifier: "menuCell")
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        
        self.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        self.clipsToBounds = true
        self.layoutMargins = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 2
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 10).cgPath
        
        tableView.layer.cornerRadius = 10
        tableView.layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "menuCell") as! MenuCell
        cell2.opt = menus[indexPath.row]
        
        let cell = MenuCell()
        cell.opt = menus[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Add handler here
        let cell = tableView.cellForRow(at: indexPath) as! MenuCell
//        print(cell.opt)
    }
}

class MenuCell: UITableViewCell {
    
    var opt: String?
    
    var optionLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Edit"
        lbl.textColor = Colors.textBlack
        lbl.font = UIFont(name: "TTNorms-Regular", size: 14)
        return lbl
    }()
    
    var optionButton: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(optionLabel)
        self.addSubview(optionButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        
        let gradientBG = CAGradientLayer().menuCellGradientLayer()
        gradientBG.frame = self.bounds
        self.layer.insertSublayer(gradientBG, at: 0)
        
        
        optionLabel.text = opt
        let img = UIImage(named: opt!)?.withRenderingMode(.alwaysTemplate)
        optionButton.tintColor = Colors.mainOrange
        optionButton.setImage(img, for: .normal)
        
        setupLabelsConstraints()
        setupButtonsConstraints()
    }
    
    func setupLabelsConstraints() {
        optionLabel.translatesAutoresizingMaskIntoConstraints = false
        optionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        optionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }
    
    func setupButtonsConstraints() {
        optionButton.translatesAutoresizingMaskIntoConstraints = false
        optionButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        optionButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        optionButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        optionButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
