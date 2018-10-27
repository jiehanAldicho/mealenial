//
//  EditPopupViewController.swift
//  ngemeal
//
//  Created by Andy Jiehan on 25/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class EditPopupView: UIView {
    
    var editLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Edit"
        lbl.textColor = Colors.textBlack
        lbl.font = UIFont(name: "Avenir", size: 14)
        return lbl
    }()
    
    var deleteLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Delete"
        lbl.textColor = Colors.textBlack
        lbl.font = UIFont(name: "Avenir", size: 14)
        return lbl
    }()
    
    var editButton: UIButton = {
        let btn = UIButton()
        let editImg = UIImage(named: "edit")?.withRenderingMode(.alwaysTemplate)
        btn.setImage(editImg, for: .normal)
        btn.tintColor = Colors.mainOrange
        return btn
    }()
    
    var deleteButton: UIButton = {
        let btn = UIButton()
        let delImg = UIImage(named: "close")?.withRenderingMode(.alwaysTemplate)
        btn.setImage(delImg, for: .normal)
        btn.tintColor = Colors.mainOrange
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = CGRect(x: 0, y: 0, width: 135, height: 90)
        
        self.addSubview(editLabel)
        self.addSubview(editButton)
        self.addSubview(deleteLabel)
        self.addSubview(deleteButton)
        
        setupLabelsConstraints()
        setupButtonsConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabelsConstraints() {
        editLabel.translatesAutoresizingMaskIntoConstraints = false
        editLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        editButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        
        deleteLabel.translatesAutoresizingMaskIntoConstraints = false
        deleteLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        deleteLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
    }
    
    func setupButtonsConstraints() {
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        editButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        editButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        editButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        deleteButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
}

class MoreOptionButton: UIButton {
    
    var optView = OptionsView()
    
    var height = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.mainOrange
        self.setTitle("POP", for: .normal)
        
        optView = OptionsView.init(frame: CGRect.zero)
    }
    
    override func didMoveToSuperview() {
        self.superview?.addSubview(optView)
        self.superview?.bringSubviewToFront(optView)
        
        optView.translatesAutoresizingMaskIntoConstraints = false
        optView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        optView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        optView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
//        optView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        optView.widthAnchor.constraint(equalToConstant: 135).isActive = true
        height = optView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    var menuIsOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if menuIsOpen == false {
            
            menuIsOpen = true
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 80
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                self.optView.layoutIfNeeded()
                self.optView.center.y += self.optView.frame.height / 2
            }, completion: nil)
        } else {
            menuIsOpen = false
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
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
        
        self.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
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
    
}

class MenuCell: UITableViewCell {
    
    var opt: String?
    
    var optionLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Edit"
        lbl.textColor = Colors.textBlack
        lbl.font = UIFont(name: "Avenir", size: 14)
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
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.clipsToBounds = true
        self.layer.cornerRadius = 5
        
        let gradientBG = CAGradientLayer().menuCellGradientLayer()
        gradientBG.frame = self.bounds
        self.layer.insertSublayer(gradientBG, at: 0)
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 2
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 5).cgPath
        
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
