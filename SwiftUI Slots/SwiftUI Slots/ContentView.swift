//
//  ContentView.swift
//  SwiftUI Slots
//
//  Created by Alexander Korchak on 30.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var number1 = 0
    @State var number2 = 0
    @State var number3 = 0
    @State var picture1 = "pic1"
    @State var picture2 = "pic2"
    @State var picture3 = "pic3"
    @State var credits = 1000
    @State var lose = ""

    var body: some View {
        
        VStack {
            Text("SwiftUI Slots").font(.largeTitle)
            Spacer()
            HStack {
                Text("Credits:")
                Text(String(credits))
            }
            Spacer()
            HStack {
                Image(picture1)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                Image(picture2)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                Image(picture3)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
            }
            Spacer()
            
            Text(lose).font(.largeTitle).foregroundColor(.red)
            
            Spacer()
            
            Button("Spin") {
                randomize()
                picture1 = "pic" + String(number1)
                picture2 = "pic" + String(number2)
                picture3 = "pic" + String(number3)
                
                if (picture1 == picture2) && (picture2 == picture3) && (credits != 0) {
                    credits += 15
                } else if credits != 0 {
                    credits -= 5
                }
                
                if credits == 0 {
                    lose = "You're out of credits!"
                }
            }
            .padding()
            .padding([.leading, .trailing], 40)
            .foregroundColor(.white)
            .background(Color(.systemPink))
            .cornerRadius(25)
            .font(.system(size: 18, weight: .bold, design: .default))
            Spacer()
        }
    }
    func randomize() {
       number1 = Int.random(in: 1...3)
       number2 = Int.random(in: 1...3)
       number3 = Int.random(in: 1...3)
    }
    

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
