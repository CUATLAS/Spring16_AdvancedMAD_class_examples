//
//  CollectionViewController.swift
//  pictureCollection
//
//  Created by Aileen Pierce on 2/11/16.
//  Copyright © 2016 Aileen Pierce. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let reuseIdentifier = "Cell"
    var expoImages=[String]()
    let sectionInsets = UIEdgeInsets(top: 25.0, left: 10.0, bottom: 25.0, right: 10.0)
    var sharing = false
    var selectedImages = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...19{
            expoImages.append("atlas" + String(i+1))
        }
        
/*
        //changes scroll direction
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        self.collectionView?.setCollectionViewLayout(layout, animated: true)
*/
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        // self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return expoImages.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
    
        // Configure the cell
        let image = UIImage(named: expoImages[indexPath.row])
        cell.imageView.image = image
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        var header: CollectionSupplementaryView?
        if kind == UICollectionElementKindSectionHeader{
            header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "Header", forIndexPath: indexPath) as? CollectionSupplementaryView
            header?.headerLabel.text = "Fall 2015"
        }
        return header!
    }
    
    // UICollectionViewDelegateFlowLayout method
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let image = UIImage(named: expoImages[indexPath.row])

        // code to create resized image from https://www.snip2code.com/Snippet/89236/Resize-Image-in-iOS-Swift
        let newSize:CGSize = CGSize(width: (image?.size.width)!/8, height: (image?.size.height)!/8)
        let rect = CGRectMake(0, 0, newSize.width, newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image?.drawInRect(rect)
        let image2 = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //end resizing
        
        return (image2?.size)!
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail"{
            let indexPath = collectionView?.indexPathForCell(sender as! CollectionViewCell)
            let detailVC = segue.destinationViewController as! DetailViewController
            detailVC.imageName = expoImages[(indexPath?.row)!]
        }
    }
    
    @IBAction func share(sender: AnyObject) {
        var imageArray = [UIImage]()
        if !selectedImages.isEmpty {
            //share images
            for imageName in selectedImages{
                imageArray.append(UIImage(named: imageName)!)
            }
            let shareScreen = UIActivityViewController(activityItems: imageArray, applicationActivities: nil)
            shareScreen.modalPresentationStyle = .Popover
            shareScreen.popoverPresentationController?.barButtonItem = sender as? UIBarButtonItem
            presentViewController(shareScreen, animated: true, completion: nil)
            /* pre ios9 code
            let popOver = UIPopoverController(contentViewController: shareScreen)
            popOver.presentPopoverFromBarButtonItem(self.navigationItem.rightBarButtonItems!.first! as UIBarButtonItem, permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)
            */
        }
        sharing = !sharing
        collectionView?.allowsMultipleSelection = sharing
        collectionView?.selectItemAtIndexPath(nil, animated: true, scrollPosition: .None)
        
        if !sharing {
            for cell in (collectionView?.visibleCells())!{
                cell.backgroundColor = UIColor.blackColor()
            }
            selectedImages.removeAll(keepCapacity: false)
        }
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        if sharing {
            let image = expoImages[indexPath.row]
            if let foundIndex = selectedImages.indexOf(expoImages[indexPath.row]) {
                //deselect and remove
                selectedImages.removeAtIndex(foundIndex)
                collectionView.cellForItemAtIndexPath(indexPath)?.backgroundColor = UIColor.blackColor()
            } else {
                //add and select
                selectedImages.append(image)
                collectionView.cellForItemAtIndexPath(indexPath)?.backgroundColor = UIColor.yellowColor()
            }
        }
        else {
            //segue to detail view controller
            self.performSegueWithIdentifier("showDetail", sender: collectionView.cellForItemAtIndexPath(indexPath))
        }
        return false
    }
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */


    // Uncomment this method to specify if the specified item should be selected
    

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
