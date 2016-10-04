//
//  SocialViewController.swift
//  Compare
//
//  Created by 于舒洋 on 10/2/16.
//  Copyright © 2016 WB. All rights reserved.
//

import UIKit

class SocialViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //properties
    
    @IBOutlet weak var typeSelector: UISegmentedControl!
    @IBOutlet weak var profilePicTable: UITableView!
    
    
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
    
    //Action:
    @IBAction func tableSwitch(sender: UISegmentedControl) {
        profilePicTable.reloadData()
    }
    
    
}
