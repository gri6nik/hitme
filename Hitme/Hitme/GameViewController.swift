//
//  ViewController.swift
//  Hitme
//
//  Created by User on 17.12.2018.
//  Copyright © 2018 Fridrihco. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        newGame()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "snail.png")
        self.view.insertSubview(backgroundImage, at: 0)
        
    }
    
    @IBOutlet weak var begining: UILabel!
    @IBOutlet weak var theend: UILabel!
    @IBOutlet weak var nameoftheaction: UILabel!
    @IBOutlet weak var NumberLabel: UILabel!
    
  
    @IBAction func valueOfSlider(_ sender: Any) {
    }
    
    
    var currentValueOfSlider: Int = 0
    var randomValue: Int = 0
    

    func newGame (){
        randomGeneration()
    }

    func calculateResults() -> Int{

        print("Our result - \(randomValue - currentValueOfSlider )")
        return randomValue - currentValueOfSlider
        
    }

    
    func randomGeneration(){
        self.currentValueOfSlider = Int(arc4random_uniform(100)) + 1
        self.NumberLabel.text = "\(self.randomValue)"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = false
    }

    @IBAction func hitMeButton(_ sender: Any) {
        print ("tap to button")
    let messege = "Our current value of slider - \(self.currentValueOfSlider), Our results - \(calculateResults())"
    let alert = UIAlertController(title: "Win", message: messege, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tapButtonRestartView(_ sender: Any) {
        print("tap to button restore")
    }
    
    @IBAction func tapButtonInfo(_ sender: Any) {
    }
    
    @IBAction func moveSlider(_ slider: UISlider) {
        let sliderRound = Int(roundf(slider.value))
        self.currentValueOfSlider = sliderRound
        
        print(currentValueOfSlider)
    }
    
    
    

    func recalculateResults() -> Int {
            var result: Int = 0
                
            let difference = randomValue - currentValueOfSlider
                
            if difference < 0 {
                result = 100 + difference
            } else {
                result = 100 - difference
            }
                
            return result
                
            }
    
}

