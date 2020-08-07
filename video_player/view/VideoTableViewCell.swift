//
//  VideoTableViewCell.swift
//  video_player
//
//  Created by Тимур Каримов on 07/08/2020.
//  Copyright © 2020 Тимур Каримов. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    @IBOutlet var videoPreview: UIView!
    @IBOutlet var videoTitle: UILabel!
    @IBOutlet var addToFavoritesButton: UIButton!
    
    var onAddButtonTap: ((VideoTableViewCell) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func onAddToFavoritesButtonTap(_ sender: Any) {
        onAddButtonTap?(self)
        print("add to favorites")
    }
}
