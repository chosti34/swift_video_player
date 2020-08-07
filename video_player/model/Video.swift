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

    init(id: String) {
        self.id = id
    }
    
    required init?(map: Map) {
        
    }

    func mapping(map: Map) {
        
    }
}
