//
//  ViewController.swift
//  scrabbleQgrouped
//
//  Created by Aileen Pierce on 1/24/16.
//  Copyright © 2016 Aileen Pierce. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var allwords : [String : [String]]!
    var letters : [String]!
    var searchController : UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        //use a NSBundle object of the directory for our application to retrieve the pathname of qwordswithoutu1.plist
        let path = NSBundle.mainBundle().pathForResource("qwordswithoutu2", ofType: "plist")
        //load the words of the plist file into the dictionary
        allwords = NSDictionary(contentsOfFile: path!) as! [String : [String]]
        //puts all the letters in an array
        letters = Array(allwords.keys)
        // sorts the array
        letters.sortInPlace({$0 < $1})
        
        //search results
        let resultsController = SearchResultsController() //create an instance of our SearchResultsController class
        resultsController.allwords = allwords 
        resultsController.letters = letters
        searchController = UISearchController(searchResultsController: resultsController) //create a search controller and initialize with our SearchResultsController instance
        
        //search bar configuration
        searchController.searchBar.placeholder = "Enter a search term" //place holder text
        searchController.searchBar.sizeToFit() //sets appropriate size for the search bar
        tableView.tableHeaderView=searchController.searchBar //install the search bar as the table header
        searchController.searchResultsUpdater = resultsController //sets the instance to update search results
    }
    
    //Required methods for UITableViewDataSource
    //Number of rows in the section
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let letter = letters[section]
        let letterSection = allwords[letter]! as [String]
        return letterSection.count
    }

    // Displays table view cells
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = indexPath.section
        let letter = letters[section]
        let wordsSection = allwords[letter]! as [String]
        //configure the cell
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
        cell.textLabel?.text = wordsSection[indexPath.row]
        return cell
    }
    
    //UITableViewDelegate method that is called when a row is selected
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let section = indexPath.section
        let letter = letters[section]
        let wordsSection = allwords[letter]! as [String]
        let alert = UIAlertController(title: "Row selected", message: "You selected \(wordsSection[indexPath.row])", preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(okAction)
        presentViewController(alert, animated: true, completion: nil)
        //tableView.deselectRowAtIndexPath(indexPath, animated: true) //deselects the row that had been choosen
    }
    
    //UITableViewDatasource methods
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return letters.count
    }
    
    //Sets the header value for each section
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return letters[section]
    }
    
    //adds a section index    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return letters
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

