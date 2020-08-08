//
//  TopicCollectionViewCell.swift
//  video_player
//
//  Created by Тимур Каримов on 08/08/2020.
//  Copyright © 2020 Тимур Каримов. All rights reserved.
//

import UIKit

class TopicCollectionViewCell: UICollectionViewCell {
    @IBOutlet var topicLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 15
        layer.borderWidth = 1.0
        layer.borderColor = UIColor(red: 0.788, green: 0.788, blue: 0.788, alpha: 1.0).cgColor
    }
}
