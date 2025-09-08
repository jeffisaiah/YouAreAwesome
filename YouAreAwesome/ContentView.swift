//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jeff Gutierrez on 9/2/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageString = ""
    var body: some View {
        
        VStack {
            Spacer()
            
            Image(systemName: imageString)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .foregroundStyle(.black)
            
            Spacer()
            
                Button("Press Me!") {
                    let message1 = "You are Awesome!"
                    let message2 = "You are Great!"
                    let imageString1 = "hand.thumbsup"
                    let imageString2 = "sun.max.fill"
                    
//                    if message == message1 {
//                        message = message2
//                        imageString = imageString2
//                    } else {
//                        message = "You are Awesome!"
//                        imageString = imageString1
//                    }
                    
                    message = (message == message1 ? message2 : message1)
                    imageString = (message == message1 ? imageString1 :  imageString2)
                    
                }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
