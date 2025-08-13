//
//  SoundPlayer.swift
//  RestartApp
//
//  Created by Muhammed Siddiqui on 2025-08-07.
//

import Foundation
import AVFoundation

@MainActor
var audioPlayer: AVAudioPlayer?

@MainActor
func playSound(sound: String, type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        let url = URL(fileURLWithPath: path)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Not found")
        }
    }
}
