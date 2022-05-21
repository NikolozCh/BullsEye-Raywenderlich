//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Nikoloz Chitashvili on 20.05.22.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet var wkView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            let request = URLRequest(url: url)
            wkView.load(request)
        }
    }

    @IBAction func closeButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
}
