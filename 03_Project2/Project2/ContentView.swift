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
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color .black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
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
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag...")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        withAnimation {
                            self.flagTapped(number)
                        }
                            
                        
                    }) {
                        Flag(text: self.countries[number])
                        
                    }
                    .rotation3DEffect(.degrees(number == correctAnswer ? animationAmount : 0), axis: (x: 0, y: 1, z: 0))
                    .opacity(number != correctAnswer ? opacityAmount : 1)
                    
                }
                
                
                
                
                
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
