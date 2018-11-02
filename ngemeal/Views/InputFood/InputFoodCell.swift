import UIKit
import MultiSlider

class InputFoodCell: UICollectionViewCell {
    
    //MARK: Variables
    
    //Image Variables
    var imageTarget: UIImageView = {
        let image1 = UIImageView()
        
        return image1
    }()
    
    var imageVarCell: UIImage = UIImage()
    
    //Slider View Variables
    var vegVal = Int()
    var protVal = Int()
    var stapVal = Int()
    
    var sliderView: UIControl = {
        
        let slider   = MultiSlider()
        slider.minimumValue = 0    // default is 0.0
        slider.maximumValue = 100    // default is 1.0
        slider.snapStepSize = 1  // default is 0.0, i.e. don't snap
        
        slider.value = [50, 67]
        
        
        //        slider.addTarget(self, action: #selector(sliderDragEnded(_:)), forControlEvents: . touchUpInside) // sent when drag ends
        
        slider.orientation = .horizontal
        slider.tintColor = UIColor(displayP3Red: 11/255, green: 205/255, blue: 190/255, alpha: 1)
        slider.trackWidth = 7
        slider.hasRoundTrackEnds = true
        slider.showsThumbImageShadow = true
        
        slider.valueLabelPosition = .notAnAttribute // .NotAnAttribute = don't show labels
        slider.isValueLabelRelative = true // shows differences instead of absolute values
        
        return slider
    }()
    
    //Save Button Variables
    var saveMealButton: UIButton = {
        
        let btn = UIButton()
        
        btn.frame = CGRect(x: 0, y: 0, width: 198, height: 56)
        
        btn.setTitle("Add Meal", for: .normal)
        btn.titleLabel?.font = FontType(size: 20).bold
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = btn.bounds.size.width / 8
        btn.backgroundColor = UIColor(displayP3Red: 255/255, green: 160/255, blue: 71/255, alpha: 1)
        
        //Shadow
        btn.layer.masksToBounds = false
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.25
        btn.layer.shadowOffset = CGSize(width: 0, height: 1)
        btn.layer.shadowRadius = 2
        
        return btn
    }()
    
    //Calender Label Variables
    var timeLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Monday, 15 Oct 2018"
        lbl.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        lbl.font = FontType(size: 20).medium
        return lbl
    }()
    
    //Time Variables
    var time: UIView = TimeStampView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), time: Date())
    
    //Text Label Variables
    var textLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Your meal is composed of"
        lbl.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        lbl.font = FontType(size: 16).italic
        return lbl
    }()
    
    //Nutrition Variables
    var nutritionLabel = ChartNutritionStackView(50,25,25)
    
    //Portion Variables
    enum plate {
        case small
        case medium
        case large
    }
    
    var portion: plate = .medium
    
    var portionLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Portion"
        lbl.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        lbl.font = FontType(size: 16).italic
        return lbl
    }()
    
    var smallButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Small", for: .normal)
        btn.setTitleColor(UIColor(displayP3Red: 155/255, green: 155/255, blue: 155/255, alpha: 1), for: .normal)
        btn.titleLabel?.font = FontType(size: 16).medium
        return btn
    }()
    
    var mediumButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Medium", for: .normal)
        btn.setTitleColor(UIColor(displayP3Red: 255/255, green: 160/255, blue: 71/255, alpha: 1), for: .normal)
        btn.titleLabel?.font = FontType(size: 16).medium
        return btn
    }()
    
    var largeButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Large", for: .normal)
        btn.setTitleColor(UIColor(displayP3Red: 155/255, green: 155/255, blue: 155/255, alpha: 1), for: .normal)
        btn.titleLabel?.font = FontType(size: 16).medium
        return btn
    }()
    
    //Initialization
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.addSubview(timeLabel)
        self.addSubview(imageTarget)
        self.addSubview(time)
        self.addSubview(textLabel)
        self.addSubview(sliderView)
        self.addSubview(nutritionLabel)
        self.addSubview(portionLabel)
        self.addSubview(mediumButton)
        self.addSubview(smallButton)
        self.addSubview(largeButton)
        self.addSubview(saveMealButton)
        
        sliderView.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        smallButton.addTarget(self, action: #selector(pushSmallButton), for: .touchUpInside)
        mediumButton.addTarget(self, action: #selector(pushMediumButton), for: .touchUpInside)
        largeButton.addTarget(self, action: #selector(pushLargeButton), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        setupCellStyle()
        setupTimeLabel()
        setupImageConstraint()
        setupTime()
        setupTextLabel()
        setupSliderConstraint()
        setupNutrition()
        setupPortionLabel()
        setupMediumButton()
        setupSmallButton()
        setupLargeButton()
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
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 2
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 5).cgPath
    }
    
    //Save Button Setup
    func setupButtonConstraint() {
        saveMealButton.translatesAutoresizingMaskIntoConstraints = false
        saveMealButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        saveMealButton.topAnchor.constraint(equalTo: self.mediumButton.bottomAnchor, constant: 44).isActive = true
        saveMealButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        saveMealButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
        nutritionLabel.topAnchor.constraint(equalTo: self.sliderView.bottomAnchor, constant: 16).isActive = true
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
    
    //Slider Function
    func setupSliderConstraint() {
        sliderView.translatesAutoresizingMaskIntoConstraints = false
        sliderView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        sliderView.topAnchor.constraint(equalTo: self.textLabel.bottomAnchor, constant: 20).isActive = true
        sliderView.widthAnchor.constraint(equalToConstant: 280).isActive = true
        sliderView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    @objc func sliderChanged(slider: MultiSlider) {
        //        print("\(slider.value)")
        
        nutritionLabel.vegLabel.text = "\(Int(slider.value[0]))%"
        nutritionLabel.proLabel.text = "\(Int(slider.value[1] - slider.value[0]))%"
        nutritionLabel.stapLabel.text = "\(100 - Int(slider.value[1]))%"
        
        var vegValue = Int(slider.value[0])
        var proValue = Int(slider.value[1] - slider.value[0])
        var stapValue = 100 - Int(slider.value[1])
        
        print("\(nutritionLabel.vegVal)")
        print("\(nutritionLabel.proVal)")
        print("\(nutritionLabel.stapVal)")
        
    }
    
    //Portion Setup
    func setupPortionLabel() {
        portionLabel.translatesAutoresizingMaskIntoConstraints = false
        portionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        portionLabel.topAnchor.constraint(equalTo: self.nutritionLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    func setupSmallButton() {
        smallButton.translatesAutoresizingMaskIntoConstraints = false
        smallButton.centerXAnchor.constraint(equalTo: self.mediumButton.leadingAnchor, constant: -60).isActive = true
        smallButton.topAnchor.constraint(equalTo: self.portionLabel.bottomAnchor, constant: 16).isActive = true
        smallButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        smallButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupMediumButton() {
        mediumButton.translatesAutoresizingMaskIntoConstraints = false
        mediumButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mediumButton.topAnchor.constraint(equalTo: self.portionLabel.bottomAnchor, constant: 16).isActive = true
        mediumButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        mediumButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupLargeButton() {
        largeButton.translatesAutoresizingMaskIntoConstraints = false
        largeButton.centerXAnchor.constraint(equalTo: self.mediumButton.trailingAnchor, constant: 60).isActive = true
        largeButton.topAnchor.constraint(equalTo: self.portionLabel.bottomAnchor, constant: 16).isActive = true
        largeButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        largeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    @objc func pushSmallButton() {
        smallButton.setTitleColor(UIColor(displayP3Red: 255/255, green: 160/255, blue: 71/255, alpha: 1), for: .normal)
        mediumButton.setTitleColor(UIColor(displayP3Red: 155/255, green: 155/255, blue: 155/255, alpha: 1), for: .normal)
        largeButton.setTitleColor(UIColor(displayP3Red: 155/255, green: 155/255, blue: 155/255, alpha: 1), for: .normal)
        portion = .small
    }
    
    @objc func pushMediumButton() {
        smallButton.setTitleColor(UIColor(displayP3Red: 155/255, green: 155/255, blue: 155/255, alpha: 1), for: .normal)
        mediumButton.setTitleColor(UIColor(displayP3Red: 255/255, green: 160/255, blue: 71/255, alpha: 1), for: .normal)
        largeButton.setTitleColor(UIColor(displayP3Red: 155/255, green: 155/255, blue: 155/255, alpha: 1), for: .normal)
        portion = .medium
    }
    
    @objc func pushLargeButton() {
        smallButton.setTitleColor(UIColor(displayP3Red: 155/255, green: 155/255, blue: 155/255, alpha: 1), for: .normal)
        mediumButton.setTitleColor(UIColor(displayP3Red: 155/255, green: 155/255, blue: 155/255, alpha: 1), for: .normal)
        largeButton.setTitleColor(UIColor(displayP3Red: 255/255, green: 160/255, blue: 71/255, alpha: 1), for: .normal)
        portion = .large
    }
}
