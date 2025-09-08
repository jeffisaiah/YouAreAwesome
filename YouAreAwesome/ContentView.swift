//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jeff Gutierrez on 9/2/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    let numberOfImages = 10
    let numberOfSounds = 6
    var body: some View {
        
        VStack {
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .frame(height: 100)
                .minimumScaleFactor(0.5)
                .animation(.easeInOut(duration:0.15), value: message)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            
            Spacer()
            
                Button("Show Message") {
                    let messages: [String] = ["You are Awesome!",
                                              "You will pass all your classes,and receive all A's this semester!",
                                              "You are Great!",
                                              "You are Cool!",
                                              "You are the very best!"]
                    
                    var messageNumber: Int
                    repeat {
                        messageNumber = Int.random(in: 0...messages.count-1)
                    } while messageNumber == lastMessageNumber
                
                    message = messages[messageNumber]
                    lastMessageNumber = messageNumber
                    
                    var imageNumber: Int
                    repeat {
                        imageNumber = Int.random(in: 0...(numberOfImages-1))
                    } while imageNumber == lastImageNumber
    
                    imageName = "image\(imageNumber)"
                    lastImageNumber = imageNumber
                    
                    var soundNumber: Int
                    repeat {
                        soundNumber = Int.random(in: 0...numberOfSounds-1)
                    } while soundNumber == lastSoundNumber
                    
                    lastSoundNumber = soundNumber
                    let soundName = "sound\(soundNumber)"
                    
                    guard let soundFile = NSDataAsset(name: soundName) else {
                        print("😈 Could not read file name \(soundName)")
                        return
                    }
                    do {
                        audioPlayer = try AVAudioPlayer(data: soundFile.data)
                        audioPlayer.play()
                    } catch {
                        print("😈 ERROR: \(error.localizedDescription) createding audioPlayer")
                    }
                }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
