//
//  PhotoCell.swift
//  Inspired
//
//  Created by Angel Baek on 6/24/15.
//  Copyright (c) 2015 Angel Baek. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var camera: UILabel!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var iso: UILabel!
    @IBOutlet weak var shutterSpeed: UILabel!
    @IBOutlet weak var lens: UILabel!
    @IBOutlet weak var focalLength: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
