//
//  ContentView.swift
//  Discrobble
//
//  Created by Sahil Bajaj (TW) on 02.06.20.
//  Copyright © 2020 Sahil Bajaj. All rights reserved.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID()
    var value: String
}

struct ContentView: View {
    @State private var selection = 0
    @State private var name: String = "Tim"
    @State private var otherName: String = "Not Tim"
    @State private var showingAlert = false
    
    let collection = [
        Item(value:"hi"),
        Item(value:"bye"),
        Item(value:"wow"),
    ]
    
    let lastFm = [
        Item(value:"song 2"),
        Item(value:"song 1"),
        Item(value:"song 3"),
    ]
    
    var body: some View {
        TabView(selection: $selection){
            VStack {
                TextField("Enter your name", text: $name)
                Text("Hello, \(name)!")
                
                TextField("Enter your other name", text: $otherName)
                Text("Hello other, \(otherName)!")
                Button(action: {
                    self.showingAlert = true
                }) {
                    Text("Show alert")
                }
            }
            .tabItem {
                VStack {
                    Image("first")
                    Text("Login")
                }
            }
            .tag(0)
            
            List(collection) {item in
                Text(item.value)
            }
                
            .tabItem {
                VStack {
                    Image("second")
                    Text("Collection")
                }
            }
            .tag(1)
            
            List {
                Button(action: {
                    self.showingAlert = true
                }) {
                    Text("Hello world")
                }
                
                Image(systemName: "clock")
            }
            .tabItem {
                VStack {
                    Image("second")
                    Text("Last.fm")
                }
            }
            .tag(2)
            
            Text("Settings")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Settings")
                    }
            }
            .tag(3)
        }.alert(isPresented: $showingAlert) {
            Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
