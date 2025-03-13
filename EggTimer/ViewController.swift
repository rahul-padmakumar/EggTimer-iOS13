//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let hardness: [String: Int] = [
        "Soft": 3,
        "Medium": 4,
        "Hard": 7
    ]
    
    var timer: Timer? = nil
    var secondsPassed: Int = 0
    var totalTime: Int = 0

    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func onHardnessSelected(_ sender: UIButton) {
        
        print(sender.currentTitle!)
        if sender.currentTitle != nil {
            startTimer(value: hardness[sender.currentTitle!]!)
        }
        
    }
    
    @IBOutlet weak var progressView: UIProgressView!
    func startTimer(value: Int){
        progressView.progress = 0.0
        secondsPassed = 0
        totalTime = value
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter(){
        if secondsPassed < totalTime{
            print(secondsPassed)
            progressView.progress = Float(secondsPassed)/Float(totalTime)
            secondsPassed += 1
            
        } else {
            timer?.invalidate()
            titleLabel.text = "Done!"
            progressView.progress = 1.0
        }
    }
    
}
