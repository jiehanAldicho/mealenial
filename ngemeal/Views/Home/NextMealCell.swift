//
//  NextMealCell.swift
//  ngemeal
//
//  Created by Andy Jiehan Aldicho on 17/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit
import Charts

protocol NextMealCellDelegate {
    func takeCamera()
}

class NextMealCell: UICollectionViewCell, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var delegate: NextMealCellDelegate?
    
    //Pie Chart Variables
    var surveyDataCell = [("Carbs", 17), ("Protein", 33), ("Veggies", 50)]
    
    lazy var pieChart: PieChartView = {
        let p = PieChartView()
        p.translatesAutoresizingMaskIntoConstraints = false
        p.noDataText = "No date to display"
        p.legend.enabled = false
        p.chartDescription?.text = ""
        p.drawHoleEnabled = true
        
        return p
    }()
    
    //Meal Variables
    var meal: Meal?
    
    var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Your next meal"
        lbl.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        lbl.font = UIFont(name: "Avenir-Medium", size: 18)
        return lbl
    }()
    
    var addMealButton: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: 198, height: 56)
        btn.setTitle("Add Meal", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 18)
        btn.backgroundColor = .white
        btn.layer.borderWidth = 3
        btn.layer.borderColor = #colorLiteral(red: 0, green: 0.662745098, blue: 0.4901960784, alpha: 1)
        btn.layer.cornerRadius = btn.bounds.size.width / 8
        
        return btn
    }()
    
    var nutritionStack = NutritionStackView2()
    var timeStamp = TimeStampView(frame: CGRect.zero, time: Date())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(addMealButton)
        self.addSubview(titleLabel)
        self.addSubview(nutritionStack)
        self.addSubview(timeStamp)
        self.addSubview(pieChart)
        
        setupCellStyle()
        setupButtonConstraint()
        setupTitleLabelConstraint()
        setupNutritionConstraintBtn()
        setupTimeStampConstraint()
        setupPieChart()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.addBottomBorder()
        fillChart()
        
        addMealButton.addTarget(self, action: #selector(self.buttonCamera(_:)), for: .touchUpInside)
        
        //    addMealButton.layer.cornerRadius = addMealButton.bounds.size.width / 7
    }
    
    func setupButtonConstraint() {
        addMealButton.translatesAutoresizingMaskIntoConstraints = false
        addMealButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        addMealButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        addMealButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        addMealButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func buttonCamera(_ sender: UIButton) {
        guard let delegate = delegate else {
            return
        }
        
        delegate.takeCamera()
    }
}

//MARK: EXTENSION

//Constraint Function
extension NextMealCell {
    
    func setupCellStyle() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 5
        
        //Shadow
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 2
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 5).cgPath
    }
    
    func setupTitleLabelConstraint() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
    }
    
    func setupNutritionConstraintBtn() {
        nutritionStack.translatesAutoresizingMaskIntoConstraints = false
        nutritionStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -80).isActive = true
        nutritionStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nutritionStack.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nutritionStack.widthAnchor.constraint(equalToConstant: 220).isActive = true
    }
    
    func setupTimeStampConstraint() {
        timeStamp.translatesAutoresizingMaskIntoConstraints = false
        timeStamp.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        timeStamp.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        timeStamp.widthAnchor.constraint(equalToConstant: 57).isActive = true
        timeStamp.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }
}

//Pie Chart Extension
extension NextMealCell {
    func setupPieChart() {
        pieChart.translatesAutoresizingMaskIntoConstraints = false
        pieChart.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        pieChart.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16).isActive = true
        pieChart.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4).isActive = true
        pieChart.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4).isActive = true
    }
    
    func fillChart() {
        let stapleColor = UIColor(displayP3Red: 243/255, green: 217/255, blue: 2/255, alpha: 1)
        let proteinColor = UIColor(displayP3Red: 237/255, green: 89/255, blue: 81/255, alpha: 1)
        let veggieColor = UIColor(displayP3Red: 140/255, green: 224/255, blue: 207/255, alpha: 1)
        let myColors: [UIColor] = [stapleColor, proteinColor, veggieColor ]
        
        
        
        var dataEntries = [PieChartDataEntry]()
        
        for data in surveyDataCell {
            let percent = Double(data.1) / 100
            let entry = PieChartDataEntry(value: percent)
            dataEntries.append(entry)
        }
        
        
        let chartDataSet = PieChartDataSet(values: dataEntries, label: "")
        chartDataSet.colors = myColors as! [NSUIColor]
        
        chartDataSet.sliceSpace = 2
        chartDataSet.selectionShift = 5
        
        let chartData = PieChartData(dataSet: chartDataSet)
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 0
        chartData.setValueFormatter(DefaultValueFormatter(formatter: formatter))
        
        pieChart.data = chartData
    }
}
