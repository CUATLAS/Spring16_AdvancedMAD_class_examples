//
//  DetailViewController.swift
//  pictureCollection
//
//  Created by Aileen Pierce on 2/13/16.
//  Copyright © 2016 Aileen Pierce. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var imageName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = imageName {
            imageView.image = UIImage(named: name)
        }
        
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
