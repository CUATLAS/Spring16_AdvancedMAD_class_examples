//
//  ContinentInfoTableViewController.swift
//  countries
//
//  Created by Aileen Pierce on 2/1/16.
//  Copyright © 2016 Aileen Pierce. All rights reserved.
//

import UIKit

class ContinentInfoTableViewController: UITableViewController {

    @IBOutlet weak var continentName: UILabel!
    @IBOutlet weak var countryNumber: UILabel!
    var name = String()
    var number = String()
    
    override func viewWillAppear(animated: Bool) {
        continentName.text=name
        countryNumber.text=number
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
