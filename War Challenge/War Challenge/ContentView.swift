//
//  ContentView.swift
//  War Challenge
//
//  Created by Alexander Korchak on 29.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
       
        ZStack {
            Image("background")
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("logo").padding()
                Spacer()
                
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button(action: {
                    
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    // Update the cards
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    
                    // Update the score
                    if playerRand > cpuRand {
                        playerScore += 1
                    } else if cpuRand > playerRand {
                        cpuScore += 1
                    }
                    
                }, label: {
                    
                    Image("dealbutton")
                    
                })
                
                Spacer()
                
                HStack {
                    
                Spacer()
                VStack {
                    Text("Player")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.bottom, 20.0)
                    Text(String(playerScore))
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                    Spacer()
                VStack {
                    Text("CPU")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.bottom, 20.0)
                    Text(String(cpuScore))
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                    Spacer()
                }
                Spacer()
            }
            Spacer()
        }
            
    }
}
    




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
