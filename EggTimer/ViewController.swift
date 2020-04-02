//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var timer = Timer()
    var player: AVAudioPlayer!

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var upLabel: UILabel!
    @IBAction func eggPressed(_ sender: UIButton) {
        progressBar.progress = 0.0
        upLabel.text = sender.currentTitle!
        timer.invalidate()
        var secondsRemaining = eggTimes[sender.currentTitle!]!
        let totalSeconds = secondsRemaining
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
               if secondsRemaining > 0 {
                   secondsRemaining -= 1
                self.progressBar.progress = 1 - Float(secondsRemaining) / Float(totalSeconds)
               }else {
                self.timer.invalidate()
                self.upLabel.text = "Done."
                self.playSound(soundName: "alarm_sound")
            }
           }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
