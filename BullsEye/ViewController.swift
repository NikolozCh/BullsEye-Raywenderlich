//
//  ViewController.swift
//  BullsEye
//
//  Created by Nikoloz Chitashvili on 29.04.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    var currentValue: Int = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentValue = lroundf(slider.value)
    }

    @IBAction func showAlert() {
        let message = "Your slider value is: \(currentValue)"
        
        let alert = UIAlertController(title: "Hello, World!", message: message, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
}

