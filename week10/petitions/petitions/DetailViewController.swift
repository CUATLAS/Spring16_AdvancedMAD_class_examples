//
//  DetailViewController.swift
//  petitions
//
//  Created by Aileen Pierce on 2/29/16.
//  Copyright © 2016 Aileen Pierce. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIWebViewDelegate {


    @IBOutlet weak var webView: UIWebView!

    @IBOutlet weak var webSpinner: UIActivityIndicatorView!

    var detailItem: String?
    
    /*
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    */
    
    func configureView(){
        if let url = detailItem{
            loadWebPage(url)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView.delegate=self
        configureView()
    }

    func loadWebPage(urlString: String){
        //the urlString should be a propery formed url
        //creates a NSURL object
        let url = NSURL(string: urlString)
        //create a NSURLRequest object
        let request = NSURLRequest(URL: url!)
        //load the NSURLRequest object in our web view
        webView.loadRequest(request)
    }
    
    //UIWebViewDelegate method that is called when a web page begins to load
    func webViewDidStartLoad(webView: UIWebView) {
        webSpinner.startAnimating()
    }
    
    //UIWebViewDelegate method that is called when a web page loads successfully
    func webViewDidFinishLoad(webView: UIWebView) {
        webSpinner.stopAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

