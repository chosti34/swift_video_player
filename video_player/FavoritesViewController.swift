//
//  FavoritesViewController.swift
//  video_player
//
//  Created by Тимур Каримов on 07/08/2020.
//  Copyright © 2020 Тимур Каримов. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var favorites: [Video] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "Избранное"
    }
}

extension FavoritesViewController: UITableViewDelegate {}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath)
        return cell
    }
}
