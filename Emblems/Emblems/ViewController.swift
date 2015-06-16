//
//  ViewController.swift
//  Emblems
//
//  Created by Adam Corcoran on 2/06/2015.
//  Copyright (c) 2015 Australian Red Cross. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var containerView : UIView! = nil
    var webView: WKWebView?

    override func loadView() {
        super.loadView()
        self.webView = WKWebView()
        self.view = self.webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Maybe this code is more for remote requests
        var url1 = NSURL(string:"http://m.redcross.org.au/content/the-emblem")
        var req1 = NSURLRequest(URL:url1!)
        self.webView!.loadRequest(req1)
        
//        NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"html"];
//        NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
//        [webView loadHTMLString:htmlString baseURL:nil];
//        let htmlFile = NSBundle.mainBundle().pathForResource("about.html", ofType: String)
//        var e: NSError?
//        let htmlFile = NSBundle.mainBundle().pathForResource("about.html", ofType: "html")
//        var url1 = NSURL(string:htmlFile!)
//        var req1 = NSURLRequest(URL:url1!)

        webView?.loadRequest(req1)
//        let htmlString = NSString(contentsOfFile: htmlFile!, encoding: NSUTF8StringEncoding, error: &e)
//        webView?.loadHTMLString(htmlString, baseURL: <#NSURL?#>)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

