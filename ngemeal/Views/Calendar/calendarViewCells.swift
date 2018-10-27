//
//  calendarViewCells.swift
//  ngemeal
//
//  Created by Andy Jiehan Aldicho on 16/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class FoodJournalTableHeaderCell: UITableViewCell {
  
  let dateLabel: UILabel = {
    let lbl = UILabel()
    lbl.text = "Your text"
    lbl.font = UIFont(name: "Avenir-Medium", size: 15)
    lbl.textColor = #colorLiteral(red: 0.1280031204, green: 0.1383292377, blue: 0.1528966129, alpha: 1)
    return lbl
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    self.selectionStyle = .none
    self.addSubview(dateLabel)
    setupDateLabelConstraint()
  }
  
  func setupDateLabelConstraint() {
    dateLabel.translatesAutoresizingMaskIntoConstraints = false
    dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

class FoodJournalTableContentCell: UITableViewCell {
  
  let tableLabelTest: UILabel = {
    let lbl = UILabel()
    lbl.text = "Testing"
    lbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    lbl.font = UIFont(name: "Avenir", size: 15)
    return lbl
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.backgroundColor = #colorLiteral(red: 0, green: 0.662745098, blue: 0.4901960784, alpha: 1)
    self.selectionStyle = .none
    self.addSubview(tableLabelTest)
    setupTableLabelConstraint()
  }
  
  func setupTableLabelConstraint() {
    tableLabelTest.translatesAutoresizingMaskIntoConstraints = false
    tableLabelTest.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    tableLabelTest.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
