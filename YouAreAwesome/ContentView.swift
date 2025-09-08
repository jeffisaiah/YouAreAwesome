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
    var body: some View {
        
        VStack {
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            
            Spacer()
            
                Button("Press Me!") {
                    let message1 = "You are Awesome!"
                    let message2 = "You are Great!"
                    let imageString1 = "image0"
                    let imageString2 = "image1"
                    
//                    if message == message1 {
//                        message = message2
//                        imageString = imageString2
//                    } else {
//                        message = "You are Awesome!"
//                        imageString = imageString1
//                    }
                    
                    message = (message == message1 ? message2 : message1)
                    imageName = (imageName == "image0" ? "image1" :  "image0")
                    
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
