//
//  CalendarViewController.swift
//  ngemeal
//
//  Created by Andy Jiehan Aldicho on 16/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    
    var fakeNavBar: UIView!
    
    var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Food Journal"
        lbl.textColor = #colorLiteral(red: 0.1554433703, green: 0.1518567502, blue: 0.150703907, alpha: 1)
        lbl.font = FontType(size: 30).bold
        return lbl
    }()
    
    let dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "This Week"
        lbl.font = FontType(size: 20).bold
        lbl.textColor = #colorLiteral(red: 0.1866135001, green: 0.1866517365, blue: 0.1866084635, alpha: 1)
        lbl.frame = CGRect(x: 0, y: 0, width: 70, height: 30)
        lbl.backgroundColor = .clear
        
        let layerView = UIView(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
        let labelGradientBG = CAGradientLayer()
        let greenStart = UIColor(displayP3Red: 241/255, green: 250/255, blue: 139/255, alpha: 1).cgColor
        let blueEnd = UIColor(displayP3Red: 24/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
        labelGradientBG.colors = [greenStart, blueEnd]
        labelGradientBG.startPoint = CGPoint(x: -0.3, y: 0.5)
        labelGradientBG.endPoint = CGPoint(x: 1, y: 0)
        labelGradientBG.frame = layerView.bounds
        
        
        return lbl
    }()
    
    var foodIcon: UIImageView = {
        let img = UIImage(named: "food")?.withRenderingMode(.alwaysTemplate)
        let imgView = UIImageView(image: img)
        imgView.contentMode = .scaleAspectFit
        imgView.tintColor = #colorLiteral(red: 0, green: 0.662745098, blue: 0.4901960784, alpha: 1)
        return imgView
    }()
    
    var foodJournalTableView: UITableView!
    var journalTableData = [cellData]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        self.navigationItem.title = "Food Journal"
        
        //Setup tableview
        foodJournalTableView = UITableView()
        foodJournalTableView.delegate = self
        foodJournalTableView.dataSource = self
        foodJournalTableView.register(FoodJournalTableHeaderCell.self, forCellReuseIdentifier: "tableHeader")
        foodJournalTableView.register(FoodJournalTableContentCell.self, forCellReuseIdentifier: "tableContent")
        foodJournalTableView.separatorStyle = .none
        
        journalTableData = [cellData(opened: false, title: "Monday, 15 October 2018", sectionData: ["Food journal will be here soon 🎁"]),
                            cellData(opened: false, title: "Tuesday, 16 October 2018", sectionData: ["Food journal will be here soon 🎁"]),
                            cellData(opened: false, title: "Wednesday, 17 October 2018", sectionData: ["Food journal will be here soon 🎁"]),
                            cellData(opened: false, title: "Thursday, 18 October 2018", sectionData: ["Food journal will be here soon 🎁"]),
                            cellData(opened: false, title: "TGIF, 19 October 2018", sectionData: ["Food journal will be here soon 🎁"]),
                            cellData(opened: false, title: "Saturday, 20 October 2018", sectionData: ["Food journal will be here soon 🎁"]),
                            cellData(opened: false, title: "Sunday, 21 October 2018", sectionData: ["Food journal will be here soon 🎁"])
        ]
        
        //Adding subviews
        //    self.view.addSubview(titleLabel)
        //    self.view.addSubview(dateLabel)
        //    self.view.addSubview(foodIcon)
        fakeNavBar = addCustomNavbar("Food Journal")
        self.view.addSubview(foodJournalTableView)
        
        //Setup constraints
        //    setupFoodIconConstraint()
        //    setupDateLabelConstraint()
        //    setupTitleLabelConstraint()
        setupJournalTableConstraint()
    }
    
    
    func setupTitleLabelConstraint() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: foodIcon.topAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: foodIcon.trailingAnchor, constant: 10).isActive = true
    }
    
    func setupDateLabelConstraint() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    func setupFoodIconConstraint() {
        foodIcon.translatesAutoresizingMaskIntoConstraints = false
        foodIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        foodIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        foodIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        foodIcon.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    func setupJournalTableConstraint() {
        foodJournalTableView.translatesAutoresizingMaskIntoConstraints = false
        foodJournalTableView.topAnchor.constraint(equalTo: fakeNavBar.bottomAnchor, constant: 30).isActive = true
        foodJournalTableView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        
        let tabBarSize = self.tabBarController?.tabBar.bounds
        let reducedHeight = CGFloat(self.view.frame.height - fakeNavBar.frame.height -  (tabBarSize?.height)!)
        
        foodJournalTableView.heightAnchor.constraint(equalToConstant: reducedHeight).isActive = true
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

extension CalendarViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if journalTableData[section].opened == true {
            return journalTableData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let header = FoodJournalTableHeaderCell(style: .default, reuseIdentifier: "headerCell")
            header.dateLabel.text = journalTableData[indexPath.section].title
            return header
        } else {
            let content = FoodJournalTableContentCell(style: .default, reuseIdentifier: "contentCell")
            content.tableLabelTest.text = journalTableData[indexPath.section].sectionData[indexPath.row - 1]
            return content
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if journalTableData[indexPath.section].opened == true {
                journalTableData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            } else {
                journalTableData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
        }
    }
}

struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}
