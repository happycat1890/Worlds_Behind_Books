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


class MusicMTViewController: UIViewController, AVAudioPlayerDelegate {
    
    var player: AVAudioPlayer?
    var clipPlayer: AVAudioPlayer?
    
    var selectedSoundClip: String?
   

    var selectedMT: String?
    var soundName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedMT
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func playClip() {
        /* Source: https://stackoverflow.com/questions/32036146/how-to-play-a-sound-using-swift */
        
        let selectedFileSoundName: String = selectedSoundClip?.fileName() ?? ""
        let selectedFileNameExtension = selectedSoundClip?.fileExtension()
        
        //to accommodate for different file extensions (.mp3 or .wav)
        guard let url = Bundle.main.url(forResource: selectedFileSoundName, withExtension: selectedFileNameExtension) else { return } //you already need an 'else' clause when using 'guard' - it's just a more succinct way of an 'if let' statement
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            if selectedFileNameExtension == "mp3" {
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue) // return type of String required//
                
            } else if selectedFileNameExtension == "wav" {
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue) // return type of String required//
            }
            
            guard let player = player else {
                return
            }
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    //got solution from:
    
    /*https://stackoverflow.com/questions/32036146/how-to-play-a-sound-using-swift */
    //need input variable for chosen URL
   /* func playMusic(urlResource: String) {
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
    } */
    
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

//Source for troubleshooting with file extension

/* https://stackoverflow.com/questions/26707352/how-to-split-filename-from-file-extension-in-swift */

extension String {
    
    func fileName() -> String {
        return NSURL(fileURLWithPath: self).deletingPathExtension?.lastPathComponent ?? ""
    }
    
    func fileExtension() -> String {
        return NSURL(fileURLWithPath: self).pathExtension ?? ""
    }
}
