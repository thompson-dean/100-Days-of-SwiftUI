//
//  ContentView.swift
//  Milestone1-3
//
//  Created by Dean Thompson on 2021/10/21.
//

import SwiftUI

struct ContentView: View {
    
    var moves = ["✌️", "✋", "✊"]
    
    @State private var showingScore = false
    
    @State private var winLose = Bool.random()
    
    @State var score = 0
    
    @State private var correctAnswer = Int.random(in: 0 ... 2)
    
    @State private var scoreTitle = ""
    
    @State private var turnCount = 1
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            VStack(spacing: 50) {
                Text("Round \(turnCount)/10")
                    .foregroundColor(.white)
                    .font(.title2)
                Text("Scissors, Paper, Rock")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                
                Text(moves[correctAnswer])
                    .font(.system(size: 80))
                
                HStack {
                    Text(winLose ? "WIN" : "LOSE")
                        .foregroundColor(winLose ? .yellow : .red)
                        .font(.title)
                        .foregroundColor(.yellow)
                        .bold()
                    Text("this game!")
                        .font(.title)
                        .foregroundColor(.white)
                    
                }
                HStack {
                    Button(action: {
                        gameLogic(0)
                    }) {
                        Text(moves[0])
                    }
                    .padding()
                    Button(action: {
                        gameLogic(1)
                    }) {
                        Text(moves[1])
                    }
                    .padding()
                    Button(action: {
                        gameLogic(2)
                    }) {
                        Text(moves[2])
                    }
                    .padding()
                }
                .font(.system(size: 70))
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title2)
    
            }
            
            }
            .alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                    if turnCount == 10 {
                        self.restartGame()
                    } else {
                        self.askQuestion()
                    }
                })
        }
        
        
    }
    
    func restartGame() {
        correctAnswer = Int.random(in: 0 ... 2)
        winLose = Bool.random()
        score = 0
        turnCount = 1
    }
    
    func askQuestion() {
        turnCount += 1
        correctAnswer = Int.random(in: 0 ... 2)
        winLose = Bool.random()
        
    }
    func gameLogic(_ number: Int) {
        let correct = "Well Done! That's Correct!"
        let wrong = "That's NOT correct"
        let draw = "That's a draw not a WIN or a LOSS"
        let roundTen = "You completed 10 Rounds! Let's Start a new game!"
        if turnCount == 10 {
            scoreTitle = roundTen
            showingScore = true
        } else {
            switch winLose {
            case false:
                if number == correctAnswer {
                    scoreTitle = draw
                    showingScore = true
                }
                else if number == 0 && correctAnswer == 1 {
                    scoreTitle = wrong
                    showingScore = true
                }
                else if number == 1 && correctAnswer == 2 {
                    scoreTitle = wrong
                    showingScore = true
                }
                else if number == 2 && correctAnswer == 0 {
                    scoreTitle = wrong
                    showingScore = true
                }
                else {
                    scoreTitle = correct
                    showingScore = true
                    score += 1
                }
                
            case true:
                if number == correctAnswer {
                    scoreTitle = draw
                    showingScore = true
                }
                else if number == 0 && correctAnswer == 1 {
                    scoreTitle = correct
                    showingScore = true
                    score += 1
                }
                else if number == 1 && correctAnswer == 2 {
                    scoreTitle = correct
                    showingScore = true
                    score += 1
                }
                else if number == 2 && correctAnswer == 0 {
                    scoreTitle = correct
                    showingScore = true
                    score += 1
                    
                }
                else {
                    scoreTitle = wrong
                    showingScore = true
                    
                }
            }
        }
        
        
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

