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
    var favorites: Dictionary<String, Bool> = [:]

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Библиотека"
        
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        scene?.windows.first?.backgroundColor = .white
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        api.sendRequest(url: url, responseHandler: { (response: Any?) in
            print(response)
            self.videos.append(Video(id: "123"))
            self.tableView.reloadData()
        })
    }
}

extension VideoLibraryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as? VideoTableViewCell else { return UITableViewCell() }
        let video = videos[indexPath.row]
        cell.videoTitle.text = "Какое-то видео"
        cell.onAddButtonTap = { (cell) in
            video.isFavorite = !video.isFavorite
            cell.addToFavoritesButton.setImage((video.isFavorite ? UIImage(named: "ic_heart") : UIImage(named: "ic_heart_empty")), for: .normal)
            cell.addToFavoritesButton.imageView?.tintColor = (video.isFavorite ? UIColor.red : UIColor.white)
            self.favorites[video.id!] = video.isFavorite
        }
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
