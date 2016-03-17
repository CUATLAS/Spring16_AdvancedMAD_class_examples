//
//  WebViewController.swift
//  recipes
//
//  Created by Aileen Pierce on 3/15/16.
//  Copyright © 2016 Aileen Pierce. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var webSpinner: UIActivityIndicatorView!
    
    var webpage : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate=self
        loadWebPage()
    }

    func loadWebPage(){
        //the urlString should be a propery formed url
        guard let weburl = webpage
            else {
                print("no web page found")
                return
            }
        //creates a NSURL object
        let url = NSURL(string: weburl)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
