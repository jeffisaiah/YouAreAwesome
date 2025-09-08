//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jeff Gutierrez on 9/2/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = 0
    @State private var lastImageNumber = 0
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
                    
                    var messageNumber = Int.random(in: 0...messages.count-1)
                    while messageNumber == lastMessageNumber {
                        messageNumber = Int.random(in: 0...messages.count-1)
                    }
                    message = messages[messageNumber]
                    lastMessageNumber = messageNumber
                    
                    var imageNumber = Int.random(in: 0...9)
                    while imageNumber == lastImageNumber {
                        imageNumber = Int.random(in: 0...9)
                    }
                    imageName = "image\(Int.random(in: 0...9))"
                    lastImageNumber = imageNumber
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
