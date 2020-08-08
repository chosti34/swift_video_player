//
//  Video.swift
//  video_player
//
//  Created by Тимур Каримов on 07/08/2020.
//  Copyright © 2020 Тимур Каримов. All rights reserved.
//

import UIKit
import ObjectMapper

class Video: Mappable {
    var id: String?
    var title: String?
    var url: String?
    var preview: String?
    var topics: [String]?
    
    var isFavorite: Bool = false
    
    init() {}

    required init?(map: Map) {}

    func mapping(map: Map) {
        id      <- map["id"]
        title   <- map["meta.title"]
        url     <- map["meta.url"]
        preview <- map["meta.preview"]
        topics  <- map["meta.topics"]
    }
}
