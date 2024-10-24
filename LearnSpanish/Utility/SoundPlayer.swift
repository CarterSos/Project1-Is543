//
//  SoundPlayer.swift
//  LearnSpanish
//
//  Created by IS 543 on 10/23/24.
//


import Foundation
import AVFoundation

struct SoundPlayer {
    var player: AVAudioPlayer?

    mutating func playSound(named soundName: String) async {
        // async means it is called asynchronously and runs in background
        guard let path = Bundle.main.path(forResource: soundName, ofType: nil) else {
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            player?.play()
        } catch {
            // Ignore -- the sound just won’t play
        }
    }
}
