//
//  ViewController.swift
//  Inspired
//
//  Created by Angel Baek on 6/24/15.
//  Copyright (c) 2015 Angel Baek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let manager: PhotoManager = PhotoManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.getPhotos(["only":"Landscapes", "image_size":"4"], completion: {(photos, error) -> () in
            for photo in photos {
                println("\(photo.name!)")
                println("\(photo.imageurl!)")
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

