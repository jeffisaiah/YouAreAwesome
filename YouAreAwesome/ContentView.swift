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
    @State private var soundIsOn = true
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
            
            HStack {
                Text("Sound On:")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .border(.blue)
                    .onChange(of: soundIsOn){
                        if audioPlayer != nil && audioPlayer.isPlaying{
                                audioPlayer.stop()
                        }
                    }
                
                Spacer()
                
                Button("Show Message") {
                    let messages: [String] = ["You are Awesome!",
                                              "You will pass all your classes,and receive all A's this semester!",
                                              "You are Great!",
                                              "You are Cool!",
                                              "You are the very best!"]
                    
                   lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBounds: messages.count-1)
                    message = messages[lastMessageNumber]
                    
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBounds: numberOfImages-1)
                    imageName = "image\(lastImageNumber)"
                    
                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBounds: numberOfSounds-1)
                    if soundIsOn {
                        playSound(soundName: "sound\(lastSoundNumber)")
                    }
            }
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
        }
        .padding()
        
    }
    
    func playSound (soundName: String) {
        if audioPlayer != nil && audioPlayer.isPlaying{
                audioPlayer.stop()
        }

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
    
    func nonRepeatingRandom(lastNumber: Int, upperBounds: Int) -> Int{
        var randNum: Int
        repeat{
            randNum = Int.random(in: 0...upperBounds)
        } while lastNumber == randNum
        return randNum
    }
}

#Preview {
    ContentView()
}
