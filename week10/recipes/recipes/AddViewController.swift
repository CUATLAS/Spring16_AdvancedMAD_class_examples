//
//  AddViewController.swift
//  recipes
//
//  Created by Aileen Pierce on 3/15/16.
//  Copyright © 2016 Aileen Pierce. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var recipename: UITextField!
    @IBOutlet weak var recipeurl: UITextField!
    
    var addedrecipe = String()
    var addedurl = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "savesegue"{
            if recipename.text?.isEmpty == false {
                addedrecipe = recipename.text!
                addedurl = recipeurl.text!
            }
        }
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
