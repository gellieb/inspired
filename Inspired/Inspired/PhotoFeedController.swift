//
//  PhotoFeedController.swift
//  Inspired
//
//  Created by Angel Baek on 6/24/15.
//  Copyright (c) 2015 Angel Baek. All rights reserved.
//

import UIKit

class PhotoFeedController: UITableViewController {
    let manager : PhotoManager = PhotoManager()
    var photos: [Photo]!

    override func viewDidLoad() {
        super.viewDidLoad()
        manager.getPhotos(["feature":"popular", "sort":"created_at", "image_size":"3", "include_store":"store_download", "include_states": "voted", "rpp": "100"], completion: { (photos, error) -> () in
            self.photos = photos
            self.tableView.reloadData()
            for photo in photos {
                println("\(photo.name)")
                println("\(photo.lens)")
                println("\(photo.shutterSpeed)")
                println("\(photo.camera)")
                println("\(photo.focalLength)")
                println("\(photo.iso)")
                println("\(photo.imageurl)")
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1;
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let thePhotos = self.photos {
            return thePhotos.count;
        }
        return 0;
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PhotoCell", forIndexPath: indexPath) as! PhotoCell
        
        //So that images can load async. If loaded sync, if scrolling too quickly, next images have past loaded/repeated images
        cell.postImage.image = nil
        let photo = self.photos[indexPath.row]
        cell.camera.text = photo.camera
        cell.lens.text = photo.lens
        cell.shutterSpeed.text = photo.shutterSpeed
        cell.iso.text = photo.iso
        cell.focalLength.text = photo.focalLength
        
        //AFNetworking extension for loading images async
//        let url = NSURL(string: photo.imageurl!)
//        let imageData = NSData(contentsOfURL: url!)
//        cell.postImage = UIImage(data: imageData)
        cell.postImage.setWithImageURL(photo.imageurl!);

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
