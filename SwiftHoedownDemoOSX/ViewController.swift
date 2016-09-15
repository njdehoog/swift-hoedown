    //
//  ViewController.swift
//  SwiftHoedownDemoOSX
//
//  Created by Niels de Hoog on 14/09/15.
//  Copyright © 2015 Invisible Pixel. All rights reserved.
//

import Cocoa
import WebKit
import SwiftHoedown

class ViewController: NSViewController {

    @IBOutlet var webView: WebView! {
        didSet {
            webView.policyDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sampleFile = Bundle.main.path(forResource: "sample", ofType: "md")
        let markdown = try! String(contentsOfFile: sampleFile!)
        if let html = Hoedown.renderHTMLForMarkdown(markdown) {
            webView.mainFrame.loadHTMLString(html, baseURL: nil)
        }
    }
}

extension ViewController: WebPolicyDelegate {
    func webView(_ webView: WebView!, decidePolicyForNavigationAction actionInformation: [AnyHashable: Any]!, request: URLRequest!, frame: WebFrame!, decisionListener listener: WebPolicyDecisionListener!) {
        let navigationType = actionInformation[WebActionNavigationTypeKey] as! NSNumber
        guard case .linkClicked = WebNavigationType(rawValue: navigationType.intValue)! else {
            listener.use()
            return
        }
        guard let URL = actionInformation[WebActionOriginalURLKey] as? URL else {
            listener.use()
            return
        }
        
        listener.ignore()
        NSWorkspace.shared().open(URL)
    }
}

