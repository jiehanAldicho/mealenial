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
    
    var nextButton: UIButton = {
        let btn = UIButton()
        
        btn.frame = CGRect(x: 0, y: 0, width: 198, height: 56)
        
        btn.setTitle("I'm set!", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1), for: .normal)
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
        mealScheduleTableView.separatorStyle = .none
        mealScheduleTableView.backgroundColor = .clear
        mealScheduleTableView.register(MealScheduleCell.self, forCellReuseIdentifier: "mealSchedule")
        
        //Adding subviews
        view.addSubview(titleLabel)
        view.addSubview(addScheduleButton)
        view.addSubview(descriptionLabel)
        view.addSubview(mealScheduleTableView)
        view.addSubview(nextButton)
        
        //Setting constraints
        setupTitleConstraints()
        setupAddButtonConstraints()
        setupDescriptionConstraints()
        setupTableViewConstraint()
        setupButtonConstraint()
        
        nextButton.addTarget(self, action: #selector(navigateToMain), for: .touchUpInside)
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
    
    func setupButtonConstraint() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.topAnchor.constraint(equalTo: mealScheduleTableView.bottomAnchor, constant: 20).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func navigateToMain() {
        self.navigationController?.popViewController(animated: false)
        let mainTabBarCon = MainTabBarController() as UIViewController
        self.present(mainTabBarCon, animated: true, completion: nil)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealSchedule")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
