//
//  MealScheduleViewController.swift
//  ngemeal
//
//  Created by Andy Jiehan on 29/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class MealScheduleViewController: UIViewController {

    var fakeNavBar: UIView?
    
    var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Meal schedule"
        lbl.textColor = Colors.textBlack
        lbl.font = UIFont(name: "Avenir-Black", size: 25)
        return lbl
    }()
    
    var addScheduleButton: UIButton = {
        let btn = UIButton()
        let img = UIImage(named: "Add")?.withRenderingMode(.alwaysTemplate)
        btn.tintColor = Colors.mainOrange
        btn.setImage(img, for: .normal)
        return btn
    }()
    
    var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "How many meals do you have in a day? Tell us and we will help you eat on time"
        lbl.lineBreakMode = .byWordWrapping
        lbl.numberOfLines = 0
        lbl.textColor = Colors.textBlack
        lbl.font = UIFont(name: "Avenir-Oblique", size: 14)
        return lbl
    }()
    
    var mealScheduleTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        self.navigationController?.navigationBar.isHidden = false
        self.setCustomNavbar()
        self.navigationItem.title = "Schedule"
        
        //Tableview setup
        mealScheduleTableView = UITableView()
        mealScheduleTableView.delegate = self
        mealScheduleTableView.dataSource = self
        mealScheduleTableView.separatorColor = #colorLiteral(red: 0.8980392157, green: 0.9647058824, blue: 0.9529411765, alpha: 1)
        mealScheduleTableView.backgroundColor = .clear
        
        //Adding subviews
        view.addSubview(titleLabel)
        view.addSubview(addScheduleButton)
        view.addSubview(descriptionLabel)
        view.addSubview(mealScheduleTableView)
        
        //Setting constraints
        setupTitleConstraints()
        setupAddButtonConstraints()
        setupDescriptionConstraints()
        setupTableViewConstraint()
    }
    
    func setupTitleConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
    }
    
    func setupAddButtonConstraints() {
        addScheduleButton.translatesAutoresizingMaskIntoConstraints = false
        addScheduleButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        addScheduleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        addScheduleButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        addScheduleButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupDescriptionConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    }
    
    func setupTableViewConstraint() {
        mealScheduleTableView.translatesAutoresizingMaskIntoConstraints = false
        mealScheduleTableView.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor).isActive = true
        mealScheduleTableView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40).isActive = true
        mealScheduleTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        mealScheduleTableView.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
}

extension MealScheduleViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
