//
//  ViewController.swift
//  video_player
//
//  Created by Тимур Каримов on 06/08/2020.
//  Copyright © 2020 Тимур Каримов. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireImage

class VideoLibraryViewController: UIViewController {
    var videos: [Video] = []

    @IBOutlet var tableView: UITableView!

    private let dataProvider = VideoDataProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Библиотека"
        
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        scene?.windows.first?.backgroundColor = .white
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        dataProvider.onError = { error in
            print(error)
        }
        
        dataProvider.onSuccess = { videos in
            print("Ответ с сервера успешно обработан")
            self.videos = videos
            let favorites = App.instance.loadFavorites()
            for favorite in favorites {
                let video = self.videos.first { (video) -> Bool in
                    return video.id == favorite.id
                }
                video?.isFavorite = true
            }
            self.tableView.reloadData()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataProvider.load()
    }
}

extension VideoLibraryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as? VideoTableViewCell else { return UITableViewCell() }
        let video = videos[indexPath.row]
        
        cell.videoTitle.text = video.title ?? "Неизвестный заголовок"
        cell.addToFavoritesButton.setImage((video.isFavorite ? UIImage(named: "ic_heart") : UIImage(named: "ic_heart_empty")), for: .normal)
        cell.addToFavoritesButton.imageView?.tintColor = (video.isFavorite ? UIColor.red : UIColor.white)
        
        if let url = URL(string: video.preview ?? "") {
            cell.videoPreview.af.setImage(withURL: url, placeholderImage: UIImage(named: "placeholder"))
        } else {
            cell.videoPreview.image = UIImage(named: "placeholder")
        }
        
        cell.addToFavoritesCallback = { (cell) in
            video.isFavorite = !video.isFavorite
            cell.addToFavoritesButton.setImage((video.isFavorite ? UIImage(named: "ic_heart") : UIImage(named: "ic_heart_empty")), for: .normal)
            cell.addToFavoritesButton.imageView?.tintColor = (video.isFavorite ? UIColor.red : UIColor.white)
            App.instance.saveFavoriteVideos(self.videos)
        }
        
        return cell
    }
}

extension VideoLibraryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "VideoDetailsViewController") as? VideoDetailsViewController {
            viewController.video = videos[indexPath.row]
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
