//
//  App.swift
//  video_player
//
//  Created by Тимур Каримов on 08/08/2020.
//  Copyright © 2020 Тимур Каримов. All rights reserved.
//

import UIKit
import ObjectMapper

class App {
    static let instance = App()
    private init() {}
    
    func saveFavoriteVideos(_ videos: [Video]) {
        let favorites = videos.filter { video in
            return video.isFavorite
        }
        let jsonString = favorites.toJSONString(prettyPrint: true)
        UserDefaults.standard.set(jsonString, forKey: "Favorites")
        print(jsonString)
    }
    
    func loadFavorites() -> [Video] {
        if let json = UserDefaults.standard.string(forKey: "Favorites") {
            print(json)
            if let items = Mapper<Video>().mapArray(JSONString: json)  {
                return items
            }
        }
        return []
    }
}
