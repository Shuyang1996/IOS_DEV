//
//  SocialViewController.swift
//  Compare
//
//  Created by 于舒洋 on 10/2/16.
//  Copyright © 2016 WB. All rights reserved.
//

import UIKit

class SocialViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //properties
    
    @IBOutlet weak var typeSelector: UISegmentedControl!
    @IBOutlet weak var profilePicTable: UITableView!
    @IBOutlet weak var currentProfilePic: UIImageView!
    
    
    //hard coded data for now
    let friends:[String] = ["Friend1","Friend2","Friend3","Friend4","Friend5","Friend6"]
    let me:[String] = ["My pic 1          20 votes",
                       "My pic 2          10 votes",
                       "My pic 3          5   votes",
                       "My pic 4          1   votes",
                       "My pic 5          2   votes",
                       "My pic 6          9   votes",
                       "My pic 7          8   votes",
                       "My pic 8          16 votes"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    // required functions for UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var returnValue = 0
        
        switch(typeSelector.selectedSegmentIndex)
        {
        case 0:
            returnValue = friends.count
            break
        case 1:
            returnValue = me.count
            break
            
        default:
            break
        }
            
        return returnValue
    }
        
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let myCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        
        switch(typeSelector.selectedSegmentIndex) {
            case 0:
                myCell.textLabel!.text = friends[indexPath.row]
                break
            case 1:
                myCell.textLabel!.text = me[indexPath.row]
                break
            
            default:
                break
            
        }
        
        return myCell
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        currentProfilePic.image = selectedImage
        
        // Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    
    
    //Action:
    
    //#1 load table data
    @IBAction func tableSwitch(sender: UISegmentedControl) {
        profilePicTable.reloadData()
    }
    
    //#2 set up image picker
    @IBAction func imagePicker(sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .PhotoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
   
    
    
    
}
