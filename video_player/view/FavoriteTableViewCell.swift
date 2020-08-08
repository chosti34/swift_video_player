//
//  FavoriteTableViewCell.swift
//  video_player
//
//  Created by Тимур Каримов on 08/08/2020.
//  Copyright © 2020 Тимур Каримов. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    @IBOutlet var title: UILabel!
    @IBOutlet var preview: UIImageView!
    @IBOutlet var deleteFromFavoritesButton: UIButton!
    
    var onDeleteFromFavoritesCallback: (() -> Void)?
    
    @IBAction func onDeleteFromFavorites(_ sender: Any) {
        onDeleteFromFavoritesCallback?()
    }
}
