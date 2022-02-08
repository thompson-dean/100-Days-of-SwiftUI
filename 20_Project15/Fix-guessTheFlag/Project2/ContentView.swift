//
//  ContentView.swift
//  Project2
//
//  Created by Dean Thompson on 2021/10/17.
//

import SwiftUI

struct Flag: View {
    var text: String
    
    var body: some View {
        Image(text)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color .black, lineWidth: 1))
            .shadow(color: .black, radius: 1)
    }
    
}

struct ContentView: View {
    @State private var animationAmount: Double = 0
    @State private var opacityAmount: Double = 1
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var score = 0
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .blue], startPoint: .trailing, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                
                Text("Guess The Flag!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.black)
                    .padding(.top, 30)
                
                ZStack {
                    Color.white
                        .opacity(0.5)
                        .shadow(color: .gray, radius: 2, x: 1, y: 1)
                    VStack {
                        
                        Text("Tap the flag...")
                            .foregroundColor(.black)
                        Text(countries[correctAnswer])
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .fontWeight(.black)
                        
                        ForEach(0 ..< 3) { number in
                            Button(action: {
                                withAnimation {
                                    self.flagTapped(number)
                                }
                            }) {
                                Flag(text: self.countries[number])
                                    .padding(10)
                                    .accessibilityLabel(labels[countries[number], default: "Unkown Flag"])
                                
                            }
                           
                            .rotation3DEffect(.degrees(number == correctAnswer ? animationAmount : 0), axis: (x: 0, y: 1, z: 0))
                            .opacity(number != correctAnswer ? opacityAmount : 1)
                            
                        }
                    }
                    
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(20)

                Text("Your score is \(score)")
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            animationAmount += 360
            opacityAmount -= 0.75
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number]), The correct Answer is \(countries[correctAnswer])!"
            score -= 1
            opacityAmount = 0
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0 ..< 2)
        opacityAmount = 1
        animationAmount = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
