//
//  ChatsViewController.swift
//  Compare
//
//  Created by 于舒洋 on 10/2/16.
//  Copyright © 2016 WB. All rights reserved.
//

import UIKit

class ChatsViewController: UIViewController {
    //properties
    @IBOutlet weak var bigTitle: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //action
    
    @IBAction func chatsButton(sender: UIButton) {
        bigTitle.text = "haha"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
