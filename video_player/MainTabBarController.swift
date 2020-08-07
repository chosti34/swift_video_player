//
//  MainTabBarViewController.swift
//  video_player
//
//  Created by Тимур Каримов on 07/08/2020.
//  Copyright © 2020 Тимур Каримов. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if #available(iOS 13, *) {
            let appearance = UITabBarAppearance()
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor(red: 1.0, green: 0.341, blue: 0.133, alpha: 1.0)
            appearance.stackedLayoutAppearance.normal.iconColor = UIColor(red: 0.886, green: 0.662, blue: 0.592, alpha: 1.0)
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.65, green: 0.454, blue: 0.392, alpha: 1.0)]
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.67, green: 0.627, blue: 0.611, alpha: 1.0)]
            tabBar.standardAppearance = appearance
        }
    }
}
