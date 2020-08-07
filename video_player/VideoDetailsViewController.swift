//
//  VideoDetailsViewController.swift
//  video_player
//
//  Created by Тимур Каримов on 07/08/2020.
//  Copyright © 2020 Тимур Каримов. All rights reserved.
//

import UIKit

class VideoDetailsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        tabBarController?.hidesBottomBarWhenPushed = true
    }
}
