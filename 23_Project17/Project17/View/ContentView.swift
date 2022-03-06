//
//  ContentView.swift
//  Project17
//
//  Created by Dean Thompson on 2022/03/03.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 10)
    }
}

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    @State private var swipeCards = [Card]()
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
    
    @State private var showingEditScreen = false
    
    @State private var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Text("Time: \(timeRemaining)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(.black).opacity(0.75)
                    .clipShape(Capsule())
                
                ZStack {
                    ForEach(swipeCards) { card in
                        CardView(card: card)  { correct in
                            withAnimation {
                                if correct {
                                    removeCards(at: index(card))
                                } else {
                                    restack(index: index(card))
                                }
                               
                            }
                        }
                        
                        .stacked(at: index(card), in: swipeCards.count)
                        .allowsHitTesting(index(card) == swipeCards.count - 1)
                        .accessibilityHidden(index(card) < swipeCards.count - 1)
                    }
                }
                .allowsHitTesting(timeRemaining > 0)
                
                if swipeCards.isEmpty {
                    Button("Start Again") {
                        resetCards()
                    }
                    .padding()
                    .background(.white)
                    .foregroundColor(.black)
                    .clipShape(Capsule())
                }
            }
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        showingEditScreen = true
                    } label : {
                        Image(systemName: "plus.circle")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(Circle())
                    }
                    
                }
                
                Spacer()
            }
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding()
            
            
            if differentiateWithoutColor || voiceOverEnabled {
                VStack {
                    Spacer()
                    
                    HStack {
                        Button {
                            withAnimation {
                                restack(index: swipeCards.count - 1)
                            }
                        } label: {
                            Image(systemName: "xmark.circle")
                                .padding()
                                .background(.black).opacity(0.7)
                                .clipShape(Circle())
                        }
                        .accessibilityLabel("Wrong")
                        .accessibilityHint("Mark your answer as being incorrect")
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                removeCards(at: swipeCards.count - 1)
                            }
                        } label: {
                            Image(systemName: "checkmark.circle")
                                .padding()
                                .background(.black).opacity(0.7)
                                .clipShape(Circle())
                        }
                        .accessibilityLabel("Correct")
                        .accessibilityHint("Mark your answer as being correct")
                        
                    }
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                }
            }
        }
        .onReceive(timer) { time in
            guard isActive else { return }
            
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == . active {
                if swipeCards.isEmpty == false {
                    isActive = true
                }
            } else {
                isActive = false
            }
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: resetCards) {
            EditCardView(viewModel: viewModel)
        }
        .onAppear(perform: resetCards)
        
    }
    
    func removeCards(at index: Int) {
        guard index >= 0 else { return }
        
        swipeCards.remove(at: index)
        if swipeCards.isEmpty {
            isActive = false
        }
    }
    
    func restack(index: Int) {
        guard index >= 0 else { return }
        let card = swipeCards[index]
        swipeCards.remove(at: index)
        swipeCards.insert(card, at: 0)
    
        
        if swipeCards.isEmpty {
            isActive = false
        }
        
    }
    
    func resetCards() {
        swipeCards = viewModel.cards
        timeRemaining = 100
        isActive = true
    }
    
    func index(_ card: Card) -> Int {
        return swipeCards.firstIndex(where: { $0.id == card.id }) ?? 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
