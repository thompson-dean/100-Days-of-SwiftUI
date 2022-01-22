//
//  ContentView.swift
//  Milestone4-6
//
//  Created by Dean Thompson on 2021/10/27.
//

import SwiftUI
import UIKit


struct ContentView: View {

    let lightBlueWhite = Color(hex: "D1E8E4")
    let lightMaroon = Color(hex: "C37B89")
    let carKeyGreen = Color(hex: "BCCC9A")
    let cream = Color(hex: "EAE7C6")
    
    let numbers = [
        ["1", "2", "3", "4"],
        [ "5", "6", "7", "8"],
        ["9", "10", "11", "12"]
    ]
    let answers = ["12", "24"]
    let questionAmount = ["5", "10", "15", "20", "All"]

    @State var selectedAmountOfQuestions = "15"
    @State var selectedNumber = "1"
    
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                
                lightMaroon
                    .ignoresSafeArea()
                
                
                VStack {
                    
                    Text("九九")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(cream)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding([.leading, .trailing], 30)
                        .padding(.top, 10)
                        .foregroundColor(.black)
                        .font(.system(size: 70, weight: .heavy))
                    
                    Text("すうじ")
                    
                        .foregroundColor(.black)
                        .font(.system(size: 30, weight: .heavy))
                        .padding(15)
                    
                    
                    ForEach(numbers, id: \.self) { row in
                        HStack {
                            ForEach(row, id: \.self) { cell in
                                Button(action: {
                                    numberAmountSelected(cell)
                                }, label: {
                                    Text(cell)
                                    
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .font(.system(size:30, weight: .heavy))
                                        .background(carKeyGreen)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .opacity(cell == selectedNumber ? 1.0 : 0.25)
                                })
                                    
                                    
                            }
                            
                        }
                        
                    }
                    .padding(3)
                    
                    Text("もんだいすう")
                        .font(.system(size: 30, weight: .heavy))
                        .foregroundColor(.black)
                        .padding(15)
                        .padding(.top, 10)
                    
                    Picker("", selection: $selectedAmountOfQuestions) {
                        ForEach(questionAmount, id: \.self) {
                            Text($0)
                                
                        }
                                            }
                    .pickerStyle(.segmented)
                    
                    .padding(15)
                    NavigationLink(destination: QuestionView(amount: $selectedAmountOfQuestions, number: $selectedNumber)) {
                        Text("スタート")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(lightBlueWhite)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding([.leading, .trailing], 30)
                            .padding(.top, 25)
                            .foregroundColor(.black)
                            .font(.system(size: 40, weight: .heavy))
                    }
                    Spacer()
                }
                .padding([.leading, .trailing])
            }
            .navigationBarTitle("", displayMode: .automatic)
            
            
        }
       
        
    }
    
    
    
    func numberAmountSelected(_ cell: String) {
        selectedNumber = cell
        
        
        
    }
    
    
    func goToQuestionView() {
        print(selectedAmountOfQuestions)
        print(selectedNumber)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
