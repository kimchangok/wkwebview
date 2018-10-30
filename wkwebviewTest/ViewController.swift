//
//  ViewController.swift
//  wkwebviewTest
//
//  Created by changok on 2018. 10. 30..
//  Copyright © 2018년 Inswave systems. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var btnLeft: UIButton!
    @IBOutlet weak var btnRight: UIButton!
    
    var targetUrl = "https://www.google.co.kr"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        webView.allowsBackForwardNavigationGestures = true
        let urlRequest = URLRequest(url:URL(string:targetUrl)!)
        webView.load(urlRequest)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func goToBack(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func goToForward(_ sender: Any) {
        webView.goForward()
    }
    
}

extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        btnLeft.isHidden = (webView.canGoBack) ? false : true
        btnRight.isHidden = (webView.canGoForward) ? false : true
    }
}

extension ViewController: WKUIDelegate {
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration,
                 for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        
        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
        }
        
        return nil
    }
}
