//
//  QuestionView.swift
//  Milestone4-6
//
//  Created by Dean Thompson on 2021/11/09.
//

import SwiftUI
import UIKit

struct deanView: View {
    let lightBlueWhite = Color(hex: "D1E8E4")
    
    var answer: String
    
    var body: some View {
        Text(answer)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .font(.system(size:30, weight: .heavy))
            .background(lightBlueWhite)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(5)
            .padding([.leading, .trailing], 25)
    }
}

struct QuestionView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var phrases = ["素晴らしい！", "すごい！", "じょうずだね！"]
    
    @State private var animationAmount: Double = 0
    @State private var opacityAmount: Double = 1
    
    let lightBlueWhite = Color(hex: "D1E8E4")
    let lightMaroon = Color(hex: "C37B89")
    let carKeyGreen = Color(hex: "BCCC9A")
    let cream = Color(hex: "EAE7C6")
    
    @State var answerOptions = ["12", "24", "36", "48"]
    
    
    
    
    @State var rightNumber = String(Int.random(in: 0...12))
    @Binding var amount: String
    @Binding var number: String
    
    
    
    
    @State var round = 0
    @State var score = 0
    
    @State var showAlert = false
    @State var alertTitle = "やって　みよう！"
    @State var alertMessage = "たかい　てんすう　を　ゲット　やって　みよう！"
    @State var alertButton = "OK"
    
    
    var body: some View {
        
        ZStack {
            
            lightMaroon
                .ignoresSafeArea()
            
            VStack {
                
                Text("\(number)にちょうせん！")
                //                    .frame(maxWidth: .infinity, maxHeight: 100)
                //                    .background(cream)
                //                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    .padding([.top, .bottom], 10)
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .heavy))
                
                
                
                Text("\(number) x \(rightNumber)")
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .background(carKeyGreen)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding([.leading, .trailing], 30)
                    .padding([.top, .bottom], 10)
                    .foregroundColor(.black)
                    .font(.system(size: 70, weight: .heavy))
                
                
                ForEach(answerOptions, id: \.self) { answer in
                    Button(action: {
                        withAnimation {
                            self.buttonPressed(answer)
                        }
                        
                    }, label: {
                        deanView(answer: answer)
                        
                        
                    })
                        .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 0, z: 0))
                        .opacity(opacityAmount)
                    
                }
                Spacer()
                Text("もんだい　\(round)/\(amount)")
                    .foregroundColor(.black)
                    .font(.system(size: 30, weight: .heavy))
                    .padding()
                Text("てんすう: \(score)")
                    .font(.title2)
            }
            
        }
        .onAppear{
            score = 0
            askQuestion()
            
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text(alertButton)) {
                
                let amountInt = Int(amount)!
                if round >= amountInt  {
                    
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    self.askQuestion()
                }
                
                
            })
        }
        
    }
    
    
    
    func askQuestion() {
        
        opacityAmount = 1
        animationAmount = 0
        
        answerOptions = []
        
        rightNumber = String(Int.random(in: 0...12))
        let rightNumberInt = (Int(rightNumber))!
        let numberInt = Int(number)!
        let numberToAdd = rightNumberInt * numberInt
        let numberString = String(numberToAdd)
        answerOptions.append(numberString)
        for _ in 0..<3 {
            answerOptions.append(String(Int.random(in: 0...120)))
        }
        
        round += 1
        
        answerOptions.shuffle()
        print(answerOptions)
        
        
    }
    func buttonPressed(_ answer: String) {
        let x = Int(number)!
        let y = Int(rightNumber)!
        let jazz = Int(answer)!
        let amountInt = Int(amount)!
        if round >= amountInt {
            score += 100
            alertTitle = "ナイス！　\(phrases[Int.random(in: 0 ..< 3)])"
            alertMessage = "てんすう：\(score)! ほかのすうじをやってみてください！"
            alertButton = "ホームへ"
        } else {
            if jazz == (x * y) {
                
                
                animationAmount += 360
                score += 100
                alertTitle = "ピンポーン"
                alertMessage = "100 ポイント! てんすうは \(score)です！"
                alertButton = "OK"
                showAlert = true
            } else {
                
                opacityAmount = 0.25
                score -= 100
                alertTitle = "ブッブー"
                alertMessage = "- 100 ポイント! てんすうは \(score)です！"
                alertButton = "OK"
                showAlert = true
            }
        }
        
        
        
        showAlert = true
        
        
    }
    
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(amount: .constant("20"), number: .constant("12"))
    }
}
