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

    var videos: [Video] = []

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Библиотека"
        
        api.sendRequest(url: url, responseHandler: { (response: Any?) in
            print(response)
            self.videos.append(Video(id: "123"))
            self.tableView.reloadData()
        })
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

extension VideoLibraryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as? VideoTableViewCell else { return UITableViewCell() }
        cell.videoTitle.text = "Какое-то видео"
        return cell
    }
}

extension VideoLibraryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "VideoDetailsViewController") as? VideoDetailsViewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
