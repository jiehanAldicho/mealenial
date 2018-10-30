//
//  AccountViewController.swift
//  ngemeal
//
//  Created by Andy Jiehan Aldicho on 16/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    var fakeNavBar: UIView!
    
    let labelName: UILabel = {
        let lbl = UILabel()
        lbl.text = "The developer is too hungry to build this page 🍽"
        lbl.numberOfLines = 0
        lbl.textColor = .black
        lbl.textAlignment = .center
        return lbl
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        self.navigationItem.title = "Account"
        
        fakeNavBar = addCustomNavbar("Account")
        
        setupLabelNameConstraint()
        // Do any additional setup after loading the view.
    }
    
    func setupLabelNameConstraint() {
        self.view.addSubview(labelName)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        //    labelName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        labelName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        labelName.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
