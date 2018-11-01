//
//  InputFoodCell.swift
//  ngemeal
//
//  Created by Yuvens Putra Barata on 23/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit
import Charts

class InputFoodCell: UICollectionViewCell {
    
    //MARK: Variables
    
    //Image Variables
    var imageTarget: UIImageView = {
        let image1 = UIImageView()
        
        return image1
    }()
    
    var imageVarCell: UIImage = UIImage()
    
    //Pie Chart Variables
//    var surveyDataCell = [String:Int]()
    var surveyDataCell = [(String, Int)]()
    
    lazy var pieChart: PieChartView = {
        let p = PieChartView()
        p.translatesAutoresizingMaskIntoConstraints = false
        p.noDataText = "No date to display"
        p.legend.enabled = false
        p.chartDescription?.text = ""
        p.drawHoleEnabled = true
        p.delegate = self
        
        return p
    }()
    
    //Save Button Variables
    var saveMealButton: UIButton = {
        
        let btn = UIButton()
        
        btn.frame = CGRect(x: 0, y: 0, width: 198, height: 56)
        
        btn.setTitle("Add Meal", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 25)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = btn.bounds.size.width / 8
        
        //Shadow
        btn.layer.masksToBounds = false
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowOffset = CGSize(width: 1, height: 1)
        btn.layer.shadowRadius = 2
        
        return btn
    }()
    
    //Calender Label Variables
    var timeLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Monday, 15 Oct 2018"
        lbl.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        lbl.font = UIFont(name: "Avenir-Medium", size: 22)
        return lbl
    }()
    
    //Time Variables
    var time: UIView = TimeStampView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), time: Date())
    
    //Text Label Variables
    var textLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Your meal is composed of"
        lbl.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        lbl.font = UIFont(name: "Avenir-Oblique", size: 16)
        return lbl
    }()
    
    //Nutrition Variables
    var nutritionLabel = ChartNutritionStackView(50,25,25)
    
    //Initialization
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.addSubview(timeLabel)
        self.addSubview(imageTarget)
        self.addSubview(time)
        self.addSubview(textLabel)
        self.addSubview(pieChart)
        self.addSubview(nutritionLabel)
        self.addSubview(saveMealButton)
        
        saveMealButton.addTarget(self, action: #selector(uploadImage), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        setupCellStyle()
        setupTimeLabel()
        setupImageConstraint()
        setupTime()
        setupTextLabel()
        fillChart()
        setupPieChart()
        setupNutrition()
        setupButtonConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// Function
extension InputFoodCell {
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
    
    //Pie Chart Function
    func setupPieChart() {
        pieChart.translatesAutoresizingMaskIntoConstraints = false
        pieChart.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        pieChart.topAnchor.constraint(equalTo: self.textLabel.bottomAnchor, constant: 16).isActive = true
        pieChart.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        pieChart.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
    }
    
    func fillChart() {
        let stapleColor = UIColor(displayP3Red: 243/255, green: 217/255, blue: 2/255, alpha: 1)
        let proteinColor = UIColor(displayP3Red: 237/255, green: 89/255, blue: 81/255, alpha: 1)
        let veggieColor = UIColor(displayP3Red: 140/255, green: 224/255, blue: 207/255, alpha: 1)
        let myColors: [UIColor] = [stapleColor, proteinColor, veggieColor ]
        
        
        
        var dataEntries = [PieChartDataEntry]()
        
        for data in surveyDataCell {
            let percent = Double(data.1) / 100
            let entry = PieChartDataEntry(value: percent, label: data.0)
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
    
    //Save Button Setup
    func setupButtonConstraint() {
        saveMealButton.translatesAutoresizingMaskIntoConstraints = false
        saveMealButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        saveMealButton.topAnchor.constraint(equalTo: self.nutritionLabel.bottomAnchor, constant: 16).isActive = true
        saveMealButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        saveMealButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    //Upload image
    @objc func uploadImage() {
        let jpegCompressionQuality: CGFloat = 0.9
        let imgToSend = imageTarget.image
        if let imageData64: Data = imgToSend?.jpegData(compressionQuality: 0.9) {
            //
        }
    }
    
    //Image Setup
    func setupImageConstraint() {
        imageTarget.clipsToBounds = true
        imageTarget.contentMode = .scaleAspectFill
        imageTarget.layer.cornerRadius = 10
        
        imageTarget.image = imageVarCell
        imageTarget.translatesAutoresizingMaskIntoConstraints = false
        imageTarget.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageTarget.topAnchor.constraint(equalTo: self.timeLabel.bottomAnchor, constant: 16).isActive = true
        imageTarget.widthAnchor.constraint(equalToConstant: 213).isActive = true
        imageTarget.heightAnchor.constraint(equalToConstant: 246).isActive = true
    }
    
    //Timestamp Label Setup
    func setupTimeLabel() {
        //Set today's date to date label
        let todayDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMM yyyy"
        let dateString = formatter.string(from: todayDate)
        timeLabel.text = dateString
        timeLabel.textAlignment = .center
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: self.topAnchor, constant: 36).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //Random Label Setup
    func setupTextLabel() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25).isActive = true
        textLabel.topAnchor.constraint(equalTo: self.imageTarget.bottomAnchor, constant: 16).isActive = true
        textLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    //Nutrition Setup
    func setupNutrition() {
        nutritionLabel.translatesAutoresizingMaskIntoConstraints = false
        nutritionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nutritionLabel.topAnchor.constraint(equalTo: self.pieChart.bottomAnchor, constant: 16).isActive = true
        nutritionLabel.heightAnchor.constraint(equalToConstant: 160).isActive = true
        nutritionLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    //Time Setup
    func setupTime() {
        time.translatesAutoresizingMaskIntoConstraints = false
        time.trailingAnchor.constraint(equalTo: imageTarget.trailingAnchor, constant: -16).isActive = true
        time.bottomAnchor.constraint(equalTo: imageTarget.bottomAnchor, constant: -16).isActive = true
        time.heightAnchor.constraint(equalToConstant: 22).isActive = true
        time.widthAnchor.constraint(equalToConstant: 57).isActive = true
    }
}

// Chart extension
extension InputFoodCell: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        let index = highlight.y
        print("Selected \(index)")
    }
}
