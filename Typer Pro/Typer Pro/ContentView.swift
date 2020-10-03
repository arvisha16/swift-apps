//
//  ContentView.swift
//  Typer Pro
//
//  Created by Aryan Sharma on 9/25/20.
//

import SwiftUI
/*
 This is Typer Pro. Everything is in one file. Feel free to use any code!
 I know, this is a little bit messy.
 It uses UserDefaults
 */
struct ContentView: View {
    
    @State private var angle: Double = 0 // This is for the save button animation
    @State private var animationAmount = 0.0 // This also is for the save button animation
    @State var text = UserDefaults.standard.object(forKey: "text") as? String ?? String() // This is the last saved text, and everytime the user presses save, the text saves to this userdefaults object called "text", and the next time you open the app, it opens the last saved "text"
    @State var keyboard = "keyboard" // This is for the keyboard (there is a trick when you hover over the keyboard image on the iPad when you use a mouse/trackpad)
    @State var saveButtonText = "Save" // This is the save button text
    let defaults = UserDefaults.standard // a faster way to use Userdefaults.standard
    
    var body: some View {
        VStack {
            HStack {
                Text("Welcome to Typer Pro")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }.padding([.top, .leading], 25.0)
            HStack {
                Image(systemName: "\(keyboard)")
                    .font(.title)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .padding(/*@START_MENU_TOKEN@*/.leading, 25.0/*@END_MENU_TOKEN@*/).onHover(perform: { hovering in
                        if hovering {
                            withAnimation {
                                keyboard = "keyboard.chevron.compact.down"
                            }
                        } else {
                            withAnimation {
                                keyboard = "keyboard"
                            }
                        }
                    })
                Text("Start Typing!")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                Spacer()
                Text("Save")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.trailing)
                    .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
                    .onTapGesture {
                        saveText()
                        withAnimation(.interpolatingSpring(stiffness: 5, damping: 5)) {
                            self.animationAmount += 360
                        }
                    }
                    
            }.transition(.opacity)
            .padding(.top, 5.0)
            TextEditor(text: $text).padding(.horizontal)
        }
        
    }
    func saveText() { // This function is called when the save button is pressed
        let savedUserText = defaults.object(forKey:"text") as? String ?? String()
        if savedUserText == text {
            defaults.set(text, forKey: "text")
            saveButtonText = "Save"
        } else {
            defaults.set(text, forKey: "text")
            text = defaults.object(forKey:"text") as? String ?? String()
            saveButtonText = "Saved!"
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
struct Title: View {
    
    var body: some View {
        HStack {
            Image(systemName: "keyboard")
            Text("Welcome To Typer Pro")
        }
    }
    
}
