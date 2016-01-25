//
//  ViewController.swift
//  scrabbleQ
//
//  Created by Aileen Pierce on 1/22/16.
//  Copyright © 2016 Aileen Pierce. All rights reserved.
//

import UIKit

class ViewController: UITableViewController{
    
    var words : [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        //use a NSBundle object of the directory for our application to retrieve the pathname of qwordswithoutu1.plist
        let path = NSBundle.mainBundle().pathForResource("qwordswithoutu1", ofType: "plist")
        //load the words of the plist file into the array
        words = NSArray(contentsOfFile: path!) as! Array
    }
    
    //Required methods for UITableViewDataSource
    //Number of rows in the section
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    // Displays table view cells
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //dequeues an existing cell if one is available, or creates a new one and adds it to the table
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
        cell.textLabel?.text = words[indexPath.row]
        return cell
    }

/*
    //UITableViewDelegate method that is called when a row is selected
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let alert = UIAlertController(title: "Row selected", message: "You selected \(words[indexPath.row])", preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(okAction)
        presentViewController(alert, animated: true, completion: nil)
        //tableView.deselectRowAtIndexPath(indexPath, animated: true) //deselects the row that had been choosen
    }
*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

