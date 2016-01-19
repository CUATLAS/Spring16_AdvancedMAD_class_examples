//
//  FourthViewController.swift
//  music
//
//  Created by Aileen Pierce on 1/18/16.
//  Copyright © 2016 Aileen Pierce. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    @IBAction func gotomusic(sender: UIButton) {
        //check to see if there's an app installed to handle this URL scheme
        if(UIApplication.sharedApplication().canOpenURL(NSURL(string: "pandora://")!)){
            //open the app with this URL scheme
            UIApplication.sharedApplication().openURL(NSURL(string: "pandora://")!)
        }else {
            if(UIApplication.sharedApplication().canOpenURL(NSURL(string: "music://")!)){
                UIApplication.sharedApplication().openURL(NSURL(string: "music://")!)
            } else {
                UIApplication.sharedApplication().openURL(NSURL(string: "http://www.apple.com/music/")!)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
