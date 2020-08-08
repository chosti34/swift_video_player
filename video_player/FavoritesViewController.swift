//
//  FavoritesViewController.swift
//  video_player
//
//  Created by Тимур Каримов on 07/08/2020.
//  Copyright © 2020 Тимур Каримов. All rights reserved.
//

import UIKit
import ObjectMapper

class FavoritesViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var favorites: [Video] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Избранное"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favorites = App.instance.loadFavorites()
        for favorite in favorites {
            favorite.isFavorite = true
        }
        tableView.reloadData()
    }
}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as? FavoriteTableViewCell else { return UITableViewCell() }
        let video = favorites[indexPath.row]
        
        cell.title.text = video.title ?? "Неизвестный заголовок"
        cell.deleteFromFavoritesButton.setImage(UIImage(named: "ic_heart"), for: .normal)
        cell.deleteFromFavoritesButton.tintColor = UIColor.red
        if let url = URL(string: video.preview ?? "") {
            cell.preview.af.setImage(withURL: url, placeholderImage: UIImage(named: "placeholder"))
        } else {
            cell.preview.image = UIImage(named: "placeholder")
        }
        
        cell.onDeleteFromFavoritesCallback = {
            let ac = UIAlertController(title: "Внимание", message: "Вы действительно хотите удалить видео из списка избранных?", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Да", style: .destructive) { (action) in
                self.favorites.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                App.instance.saveFavoriteVideos(self.favorites)
            }
            let noAction = UIAlertAction(title: "Нет", style: .cancel)
            ac.addAction(okAction)
            ac.addAction(noAction)
            self.present(ac, animated: true)
        }
        
        return cell
    }
}

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "VideoDetailsViewController") as? VideoDetailsViewController {
            viewController.video = favorites[indexPath.row]
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
