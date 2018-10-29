//
//  MainTabBarController.swift
//  ngemeal
//
//  Created by Andy Jiehan Aldicho on 16/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    delegate = self
    
    //Tab bar views setup
    let foodJournalView = createTabBarItem(FoodJournalViewController(), "calendar")
    foodJournalView.tabBarItem.title = "Food Journal"
    
    let homeView = createTabBarItem(HomeViewController(), "home")
    homeView.tabBarItem.title = "Home"
    
    let accountView = createTabBarItem(AccountViewController(), "ghost")
    accountView.tabBarItem.title = "Account"
    
    //For testing
//    let scheduleView = createTabBarItem(ScheduleViewController(), "calendar")
//    scheduleView.tabBarItem.title = "Schedule"
    
    
    //Tab bar style setup
    self.tabBar.backgroundColor = .white
    
    //Gradient tab bar background (test)
    let tabBarGradientTest = CAGradientLayer().primaryGradientLayer()
    tabBarGradientTest.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
    self.tabBar.layer.addSublayer(tabBarGradientTest)
    self.tabBar.tintColor = .white
    
    //Add tab bar views
    self.setViewControllers([foodJournalView, homeView, accountView], animated: true)
    self.selectedIndex = 1
    
    print(self.tabBar.subviews[0])
  }
  
  //Function to generate tabbar item
  private func createTabBarItem(_ view: UIViewController, _ imageName: String) -> UINavigationController {
    let item = view
    let navCon = UINavigationController(rootViewController: item)
    navCon.navigationBar.isHidden = true
    item.tabBarItem.image = UIImage(named: imageName)
    return navCon
  }
  
  override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    
  }
  
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    let fromView: UIView = tabBarController.selectedViewController!.view
    let toView  : UIView = viewController.view
    if fromView == toView {
      return false
    }
    
    UIView.transition(from: fromView, to: toView, duration: 0.3, options: UIView.AnimationOptions.transitionCrossDissolve)
    
    return true
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

extension CAGradientLayer {
  
  convenience init(frame: CGRect, colors: [UIColor]) {
    self.init()
    self.frame = frame
    self.colors = []
    for color in colors {
      self.colors?.append(color.cgColor)
    }
    startPoint = CGPoint(x: 0.3, y: 0)
    endPoint = CGPoint(x: 1, y: 0)
  }
  
  func createGradientImage() -> UIImage? {
    
    var image: UIImage? = nil
    UIGraphicsBeginImageContext(bounds.size)
    if let context = UIGraphicsGetCurrentContext() {
      render(in: context)
      image = UIGraphicsGetImageFromCurrentImageContext()
    }
    UIGraphicsEndImageContext()
    return image
  }
  
}

extension UINavigationBar {
  
  func setGradientBackground(colors: [UIColor]) {
    
    var updatedFrame = bounds
//    updatedFrame.size.height += self.frame.origin.y
    let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: colors)
    
    setBackgroundImage(gradientLayer.createGradientImage(), for: UIBarMetrics.default)
  }
  
}
