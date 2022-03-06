//
//  CardView.swift
//  Project17
//
//  Created by Dean Thompson on 2022/03/04.
//

import SwiftUI

struct CardView: View {
    var card: Card
    @State var offset = CGSize.zero
    var removal: ((Bool) -> Void)? = nil
    
    @State private var feedback = UINotificationFeedbackGenerator()
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @State private var isShowingAnswer = false
    
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                    differentiateWithoutColor
                    ? .white
                    : .white.opacity(1 - Double(abs(offset.width / 50)))
                )
            
                .background(
                    differentiateWithoutColor
                    ? nil
                    : RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(setBackgroundColors(offset: offset))
                )
                .shadow(radius: 10)
            
            VStack {
                
                if voiceOverEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                } else {
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    
                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundColor(.gray)
                    }
                }
                
                
            }
            .padding()
            .multilineTextAlignment(.center)
            
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 4, y: 0)
        .opacity(1 - Double(abs(offset.width / 50)))
        .accessibilityAddTraits(.isButton)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    feedback.prepare()
                }
                .onEnded { _ in
                    if abs(offset.width) > 100 {
                        if offset.width > 0 {
                            feedback.notificationOccurred(.success)
                            removal?(true)
                        } else {
                            feedback.notificationOccurred(.error)
                            removal?(false)
                            offset = .zero
                        }
                        
                    } else {
                        offset = .zero
                    }
                }
        )
        .onTapGesture {
            isShowingAnswer.toggle()
        }
        .animation(.spring(), value: offset)
    }
    
    //CHALLENGE 2
    func setBackgroundColors(offset: CGSize) -> Color {
        if offset.width > 0 {
            return .green
        }
        if offset.width < 0 {
            return .red
        }
        
        return .white
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
.previewInterfaceOrientation(.landscapeLeft)
    }
}
