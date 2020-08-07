//
//  BaseApi.swift
//  video_player
//
//  Created by Тимур Каримов on 07/08/2020.
//  Copyright © 2020 Тимур Каримов. All rights reserved.
//

import UIKit
import Alamofire

class BaseApi: NSObject {
    func sendRequest(url: String, responseHandler: @escaping (Any?) -> Void) {
        AF.request(url).responseJSON { response in
            if (response.error != nil) {
                print("error")
                return
            }
            responseHandler(response.value)
        }
    }
}
