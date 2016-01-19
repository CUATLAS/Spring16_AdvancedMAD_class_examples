//
//  ThirdViewController.swift
//  music
//
//  Created by Aileen Pierce on 1/18/16.
//  Copyright © 2016 Aileen Pierce. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var artistPicker: UIPickerView!
    @IBOutlet weak var choiceLabel: UILabel!
    
    let artistComponent = 0
    let albumComponent = 1
    var artistAlbums : [String: [String]]!
    var artists : [String]!
    var albums : [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //use a NSBundle object of the directory for our application to retrieve the pathname of artistalbums.plist
        let path = NSBundle.mainBundle().pathForResource("artistalbums", ofType: "plist")
        // use NSDictionary to load the plist and cast to a Dictionary
        artistAlbums =  NSDictionary(contentsOfFile: path!) as! [String:[String]]
        // asign all the Dictionary keys in the artists array
        artists = Array(artistAlbums.keys)
        // assign all the albums for the first artist in the albums array
        albums = artistAlbums[artists[0]]! as [String]
    }

    //Methods to implement the picker
    //Required for the UIPickerViewDataSource protocol
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == artistComponent {
        return artists.count
    } else {
        return albums.count
        }
    }
    
    //Picker Delegate methods
    //returns the title for the row
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == artistComponent {
        return artists[row]
    } else {
        return albums[row]
        }
        
    }
    
    //Called when a row is selected
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //checks which component was picked
        if component == artistComponent {
            let selectedArtist = artists[row] //gets the selected artist
            albums = artistAlbums[selectedArtist] //gets the albums for the selected artist
            artistPicker.reloadComponent(albumComponent) //reload the album component
            artistPicker.selectRow(0, inComponent: albumComponent, animated: true) //set the album component back to 0
        }
        let artistrow = pickerView.selectedRowInComponent(artistComponent) //gets the selected row for the artist
        let albumrow = pickerView.selectedRowInComponent(albumComponent) //gets the selected row for the album
        choiceLabel.text = "You like \(albums[albumrow]) by \(artists[artistrow])"
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
