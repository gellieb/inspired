//
//  Photo.swift
//  Inspired
//
//  Created by Angel Baek on 6/24/15.
//  Copyright (c) 2015 Angel Baek. All rights reserved.
//

import Foundation
import SwiftyJSON
class Photo: NSObject{
    
    var name: String?
    var info: String?
    var camera: String?
    var lens: String?
    var focalLength: String?
    var iso: String?
    var shutterSpeed: String?
    var highest_Rating: Double?
    var imageurl: String?
    init(data:JSON){
        self.name = data["name"].stringValue
        self.info = data["description"].stringValue
        self.camera = data["camera"].stringValue
        self.lens = data["lens"].stringValue
        self.focalLength = data["focal_length"].stringValue
        self.iso = data["iso"].stringValue
        self.shutterSpeed = data["shutter_speed"].stringValue
        self.highest_Rating = data["highest_rating"].doubleValue
        self.imageurl = data["image"][0]["url"].stringValue
    }
}