//
//  ScheduleViewController.swift
//  ngemeal
//
//  Created by Andy Jiehan on 25/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    var scheduleCollectionView: UICollectionView!

    override func viewDidLoad() {
        self.tabBarController?.tabBar.isHidden = false
        
        super.viewDidLoad()
        self.setCustomNavbar()
        self.title = "Meal Schedule"
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 25
        
        scheduleCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        scheduleCollectionView.dataSource = self
        scheduleCollectionView.delegate = self
        scheduleCollectionView.backgroundColor = Colors.backgroundColor
        scheduleCollectionView.register(ScheduleCollectionViewCell.self, forCellWithReuseIdentifier: "scheduleCell")
        
        view.addSubview(scheduleCollectionView)
        setupCollectionViewConstraint()
    }
    
    func setupCollectionViewConstraint() {
        scheduleCollectionView.translatesAutoresizingMaskIntoConstraints = false
        scheduleCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scheduleCollectionView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        scheduleCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height-80).isActive = true
        scheduleCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    }

}

extension ScheduleViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "scheduleCell", for: indexPath) as! ScheduleCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 340, height: 125)
    }
    
    func get(_ completion: @escaping () -> ()) {
        let url = "https://mealenial.herokuapp.com/schedule/add"
        let session = URLSession(configuration: .default)
        let requestURL = URL(string: url)
        
        var request = URLRequest(url: requestURL!)
        
        let jsonBody: [String: Any] = [
            "_id" : "5bd9253ebcc45a6196a61369",
        ]
        
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
                        //                        let journalArr = dataTest["journal"] as! [Any]
                        //                        self.journalData = journalArr
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
