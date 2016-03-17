//
//  RecipeTableViewController.swift
//  recipes
//
//  Created by Aileen Pierce on 3/14/16.
//  Copyright © 2016 Aileen Pierce. All rights reserved.
//

import UIKit
import Firebase

class RecipeTableViewController: UITableViewController {

    let ref = Firebase(url: "https://recipes-apierce.firebaseio.com")
    var recipes = [Recipe]()
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //set up a listener for Firebase data change events
        //this event will fire with the initial data and then all data changes
        ref.observeEventType(FEventType.Value, withBlock: {snapshot in
            self.recipes=[]
            //FDataSnapshot represents the Firebase data at a given time
            //gets all the child data nodes
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot]{
                for item in snapshots {
                    guard let recipeName = item.value["name"] as? String,
                    let recipeURL = item.value["url"] as? String
                        else {
                            continue
                        }
                    //create new recipe object
                    let newRecipe = Recipe(newname: recipeName, newurl: recipeURL)
                    //add recipe to recipes array
                    self.recipes.append(newRecipe)
                }
            }
            self.tableView.reloadData()
        })
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

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("recipecell", forIndexPath: indexPath)
        let recipe = recipes[indexPath.row]
        cell.textLabel!.text = recipe.name

        return cell
    }

    @IBAction func unwindSegue(segue:UIStoryboardSegue){
        if segue.identifier == "savesegue" {
            let source = segue.sourceViewController as! AddViewController
            if source.addedrecipe.isEmpty == false {
                //create new recipe object
                let newRecipe = Recipe(newname: source.addedrecipe, newurl: source.addedurl)
                //add recipe to recipes array
                recipes.append(newRecipe)
                //create Dictionary
                let newRecipeDict = ["name": source.addedrecipe, "url": source.addedurl]
                //create a child reference in Firebase where the key value is the recipe name
                let reciperef = ref.childByAppendingPath(source.addedrecipe)
                //write data to Firebase
                reciperef.setValue(newRecipeDict)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showdetail" {
            let detailVC = segue.destinationViewController as! WebViewController
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
            let recipe = recipes[indexPath.row]
            //sets the data for the destination controller
            detailVC.title = recipe.name
            detailVC.webpage = recipe.url
            }
    }   

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let recipe = recipes[indexPath.row]
            //create a child reference in Firebase where the key value is the recipe name
            let reciperef = ref.childByAppendingPath(recipe.name)
            // delete the row from Firebase
            reciperef.ref.removeValue()
        }
        /*
        else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }  
        */
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


}
