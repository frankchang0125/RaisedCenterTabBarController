//
//  RaisedCenterTabBarController.swift
//  RaisedCenterTabBarController
//
//  Created by Frank Chang on 13/01/2017.
//  Copyright © 2017 Frank Chang. All rights reserved.
//

import UIKit

class RaisedCenterTabBarController: UITabBarController {
    
    var centerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //addCenterRaisedButton(buttonImage: #imageLiteral(resourceName: "plus"), highlightedButtonImage: #imageLiteral(resourceName: "plus"))
        addCenterRaisedButton(buttonImage: #imageLiteral(resourceName: "plus-large"), highlightedButtonImage: #imageLiteral(resourceName: "plus-large"))
    }
    
    func addCenterRaisedButton(buttonImage: UIImage, highlightedButtonImage: UIImage) {
        centerButton = UIButton(type: .custom)
        centerButton.frame = CGRect(x: 0, y: 0, width: buttonImage.size.width, height: buttonImage.size.height)
        centerButton.setBackgroundImage(buttonImage, for: .normal)
        centerButton.setBackgroundImage(highlightedButtonImage, for: .selected)
        
        /* Turn off button shadow when pressed */
        centerButton.adjustsImageWhenHighlighted = false
        
        centerButton.addTarget(self, action: #selector(centerButtonPressed(_:)), for: .touchUpInside)
        
        let heightDifference = centerButton.frame.size.height - self.tabBar.frame.size.height
        
        self.tabBar.addSubview(centerButton)
        
        centerButton.translatesAutoresizingMaskIntoConstraints = false
        
        if heightDifference < 0 {
            centerButton.centerXAnchor.constraint(equalTo: self.tabBar.centerXAnchor).isActive = true
            centerButton.centerYAnchor.constraint(equalTo: self.tabBar.centerYAnchor).isActive = true
        } else {
            centerButton.centerXAnchor.constraint(equalTo: self.tabBar.centerXAnchor).isActive = true
            centerButton.centerYAnchor.constraint(equalTo: self.tabBar.centerYAnchor, constant: -(heightDifference / 2.0)).isActive = true
        }
    }
    
    func centerButtonPressed(_ sender: UIButton) {
        self.selectedIndex = 1
        sender.isSelected = true
    }
}

/* UITabBarDelegate */
extension RaisedCenterTabBarController {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if self.tabBarController?.selectedIndex != 1 {
            centerButton.isSelected = false
        }
    }
}
