//
//  ContentView.swift
//  Click-Me
//
//  Created by Aryan Sharma on 9/6/20.
//  Copyright © 2020 Aryan Sharma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var userPoints = 0
    @State var color = [Color.red, .orange, .yellow, .green, .blue, .purple]
    @State var rand = 0
    
    var body: some View {
        VStack {
            Text("\(Int(userPoints))").font(.system(size: 50)).bold().foregroundColor(color[rand]).padding(.bottom)
            
            Button(action: {
                self.rand = Int.random(in: 0 ... 5)
                self.userPoints += 1
            }, label: {
                Text("Tap Me!")
            }).font(.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
