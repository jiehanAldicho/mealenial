//
//  FoodJournalViewController.swift
//  ngemeal
//
//  Created by Andy Jiehan on 23/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class FoodJournalViewController: UIViewController {
    
    var fakeNavBar: UIView!
    var weekPicker: WeekPickerView!
    var foodJournalCollectionView: UICollectionView!
    
    var journalObj = [String: Any]()
    var journalData = [Any]()
    
    var INDEXPATH: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestFood {
            DispatchQueue.main.sync {
                self.foodJournalCollectionView.reloadData()
            }
        }
        view.backgroundColor = Colors.backgroundColor
        fakeNavBar = addCustomNavbar("Food Journal")
        weekPicker = WeekPickerView()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        
        foodJournalCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        foodJournalCollectionView.dataSource = self
        foodJournalCollectionView.delegate = self
        foodJournalCollectionView.backgroundColor = .white
        foodJournalCollectionView.register(FoodJournalDateCell.self, forCellWithReuseIdentifier: "dateCell")
        foodJournalCollectionView.backgroundColor = .clear
        
        view.addSubview(weekPicker)
        view.addSubview(foodJournalCollectionView)
        
        
        setupWeekPickerConstraints()
        setupCollectionViewConstraint()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    func setupWeekPickerConstraints()  {
        weekPicker.translatesAutoresizingMaskIntoConstraints = false
        weekPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        weekPicker.topAnchor.constraint(equalTo: fakeNavBar.bottomAnchor, constant: 20).isActive = true
        weekPicker.widthAnchor.constraint(equalToConstant: 343).isActive = true
        weekPicker.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupCollectionViewConstraint() {
        foodJournalCollectionView.translatesAutoresizingMaskIntoConstraints = false
        foodJournalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        foodJournalCollectionView.topAnchor.constraint(equalTo: weekPicker.bottomAnchor, constant: 15).isActive = true
        foodJournalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
//        foodJournalCollectionView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        foodJournalCollectionView.heightAnchor.constraint(equalToConstant: 600).isActive = true
    }
    
    func navigateToDetail(indexPath: IndexPath) {
        //Pass data to detailVC
        INDEXPATH = indexPath
        let detailVC = FoodDetailViewController()
        detailVC.journalData = [journalData[INDEXPATH!.row]]
        print("INI YAAAAAAA \(detailVC.journalData)")
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension FoodJournalViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, MealCellDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return journalData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dateCell = collectionView.dequeueReusableCell(withReuseIdentifier: "dateCell", for: indexPath) as! FoodJournalDateCell
        dateCell.delegate = self
        dateCell.journalData = journalData
        return dateCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 40, height: 170)
    }
    
    func requestFood(_ completion: @escaping () -> ()) {
        let url = "https://mealenial.herokuapp.com/journal/findbyuser"
        let session = URLSession(configuration: .default)
        let requestURL = URL(string: url)
        
        var request = URLRequest(url: requestURL!)
        
        let jsonBody = ["_id" : "5bd9253ebcc45a6196a61369"]
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody, options: [])
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData!
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let err = error {
                print(err)
            } else if let receivedData = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: receivedData, options: [])
                    if let dataTest = json as? [String: Any] {
                        print("🍤Data", dataTest)
                        let journalArr = dataTest["journal"] as! [Any]
                        self.journalData = journalArr
                    }
                    completion()
                } catch {
                    print(error)
                }
            }
        }
        dataTask.resume()
    }
}
