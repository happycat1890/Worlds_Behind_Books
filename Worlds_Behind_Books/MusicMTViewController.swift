//
//  MusicPlayerViewController.swift
//  Worlds_Behind_Books
//
//  Created by Molly's Work Account on 6/17/18.
//  Copyright © 2018 Molly's Work Account. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox // ?

class MusicPlayerViewController: UIViewController, AVAudioPlayerDelegate {
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    //got solution from:
    
    /*https://stackoverflow.com/questions/32036146/how-to-play-a-sound-using-swift */
    //need input variable for chosen URL
    func playMusic(urlResource: String) {
        //need to implement actual sounds
        //all clips must have one uniform extension - must be maintained in documentation
        guard let soundURL = Bundle.main.url(forResource: urlResource, withExtension: "mp3") else {
            return
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: soundURL, fileTypeHint: AVFileType.mp3.rawValue)
            
            //why need this?
            guard let player = player else {return}
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
