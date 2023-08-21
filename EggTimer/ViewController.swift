

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondsPassed = 0
    
   /* let softTime = 3
    let mediumTime = 4
    let hardTime = 7 */
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle! //Soft,  Medium, Hard
        totalTime = eggTimes [hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
    }
    
   @objc func updateTimer () {
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime))
            
        } else {
            timer.invalidate()
            titleLabel.text  = "DONE!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
        }
    }
        
        /* let hardness = sender.currentTitle
        
        if hardness == "Soft" {
            print(softTime)
        } else if hardness == "Medium" {
            print(mediumTime)
        } else {
            print(hardTime)
            
        }
        
    } */
      
    
    /* bu da bir yöntem:
     
     switch hardness {
     case "soft":
     print(softTime)
     case "Medium":
     print(mediumTime)
     case "Hard":
     print(hardTime)
     default:
     print("Error")
     
     }
     }
     */
    
    
}


