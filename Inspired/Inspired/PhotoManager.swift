//
//  PhotoManager.swift
//  Inspired
//
//  Created by Angel Baek on 6/24/15.
//  Copyright (c) 2015 Angel Baek. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
class PhotoManager: NSObject {
    let consumer_key = "Kpk3XFOpPuMIbSPRDVVkI8U7DMVII8ZB82QebGAQ"
    let baseurl = "https://api.500px.com/v1/photos/search"
    
    func getPhotos(var params: [String: String], completion: (photos: [Photo], error: NSError?)->()) {
        
        params["consumer_key"] = consumer_key
        Alamofire.request(.GET, baseurl, parameters: params, encoding: ParameterEncoding.URL).responseJSON {(request, response, data, error) -> Void in
            let jsonData = JSON(data!)
            var photos: [Photo] = []
            for (_,photo) in jsonData["photos"] {
                let newphoto: Photo = Photo(data: photo)
                photos.append(newphoto)
            }
            return completion(photos: photos, error: error)
        }
    }
    
    
}
