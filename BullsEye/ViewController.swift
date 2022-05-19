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
        startNewGame()
    }

    @IBAction func showAlert() {
        let difference: Int = abs(targetValue - currentValue)
        var accuiredPoints: Int = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            accuiredPoints += 100
        }
        else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                accuiredPoints += 50
            }
        }
        else if difference < 10 {
            title = "Pretty good!"
        }
        else {
            title = "Not even close..."
        }
        userScore += accuiredPoints
        
        let message = "You scored \(accuiredPoints) points"
        // Creating UIAlertController to notify user
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // Creating UIAlertAction to be added in UIAlertController later
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: /*  Closure */{ _ in
            self.startNewRound()
        })
        
        /*
         * Trailing Closures:
         * if the final parameter (or parameters) in your method/function is a closure, you can put the closure outside the closing parenthesis of the method/function.
         *
         * This would be the valid as well:
         * let alertAction = UIAlertAction(title: "OK", style: .default) { _ in
         *       self.startNewRound()
         * })
         */
        
        
        // Adding action to alert
        alert.addAction(alertAction)
        // Presenting the alert
        present(alert, animated: true, completion: nil)
        // Hit Me! pressed, after all calculations, we are starting a new round
//        startNewRound()
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startNewGame() { // User clicks the button, "Start Over"
        userScore = 0
        roundNumberTracker = 0
        startNewRound()
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

