//
//  VideoDataProvider.swift
//  video_player
//
//  Created by Тимур Каримов on 08/08/2020.
//  Copyright © 2020 Тимур Каримов. All rights reserved.
//

import UIKit
import ObjectMapper

class VideoDataProvider: NSObject {
    private let url = "https://github.com/Tandyru/ispring-ios-test/raw/master/data.json"
    private let api = BaseApi()
    
    typealias OnSuccessCallback = ([Video]) -> Void
    typealias OnErrorCallback = (String) -> Void
    
    var onSuccess: OnSuccessCallback?
    var onError: OnErrorCallback?
    
    func load() {
        api.sendRequest(url: url, responseHandler: { (response: Any?) in
            if let jsonRoot = response as? [String: Any] {
                if let jsonVideos = jsonRoot["videos"] as? [[String: Any]] {
                    if let videos = Mapper<Video>().mapArray(JSONObject: jsonVideos) {
                        self.onSuccess?(videos)
                        return
                    }
                }
            }
            self.onError?("Не удалось разобрать ответ с сервера")
        })
    }
}
