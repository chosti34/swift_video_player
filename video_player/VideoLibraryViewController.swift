//
//  ViewController.swift
//  video_player
//
//  Created by Тимур Каримов on 06/08/2020.
//  Copyright © 2020 Тимур Каримов. All rights reserved.
//

import UIKit
import Alamofire

class VideoLibraryViewController: UIViewController {
    let api = BaseApi()
    let url = "https://github.com/Tandyru/ispring-ios-test/raw/master/data.json"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        api.sendRequest(url: url, responseHandler: { (response: Any?) in
            print(response)
        })
    }
}
