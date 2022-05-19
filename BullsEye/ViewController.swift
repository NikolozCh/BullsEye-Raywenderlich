//
//  ViewController.swift
//  BullsEye
//
//  Created by Nikoloz Chitashvili on 29.04.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetValueOutlet: UILabel!
    @IBOutlet var userScoreOutlet: UILabel!
    @IBOutlet var roundNumberOutlet: UILabel!
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var userScore: Int = 0
    var roundNumberTracker: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }

    @IBAction func showAlert() {
        let difference: Int = abs(targetValue - currentValue)
        let accuiredPoints: Int = 100 - difference
        userScore += accuiredPoints
        
        let message = "You scored \(accuiredPoints) points"
        // Creating UIAlertController to notify user
        let alert = UIAlertController(title: "Hello, World!", message: message, preferredStyle: .alert)
        // Creating UIAlertAction to be added in UIAlertController later
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        // Adding action to alert
        alert.addAction(alertAction)
        // Presenting the alert
        present(alert, animated: true, completion: nil)
        // Hit Me! pressed, after all calculations, we are starting a new round
        startNewRound()
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        roundNumberTracker += 1
        currentValue = 50
        slider.value = Float(currentValue)
        // Generating random number on start of the application and setting it to the targetValue
        targetValue = Int.random(in: 1...100)
        updateLabels()
    }
    
    func updateLabels() {
        // Setting the Outlet 'targetValue's value
        targetValueOutlet.text = String(targetValue)
        // Updating user's score label
        userScoreOutlet.text = String(userScore)
        // Updating round number
        roundNumberOutlet.text = String(roundNumberTracker)
    }
}

