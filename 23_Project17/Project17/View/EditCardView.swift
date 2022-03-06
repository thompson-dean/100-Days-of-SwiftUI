//
//  EditCardView.swift
//  Project17
//
//  Created by Dean Thompson on 2022/03/04.
//

import SwiftUI

struct EditCardView: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    @State private var prompt = ""
    @State private var answer = ""
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    
                    Section(header: Text("Add New Card")) {
                        TextField("Add Prompt..", text: $prompt)
                        TextField("Add Answer..", text: $answer)
                        Button {
                            viewModel.addCard(Card(prompt: prompt, answer: answer))
                            //CHALLENGE 1
                            prompt = ""
                            answer = ""
                        } label: {
                            Text("Add")
                            
                        }
                        .disabled(prompt.isEmpty || answer.isEmpty)
                    }
                    
                    Section {
                        List {
                            ForEach(0..<viewModel.cards.count, id: \.self) { index in
                                VStack(alignment: .leading) {
                                    Text(viewModel.cards[index].prompt)
                                        .font(.headline)
                                    Text(viewModel.cards[index].answer)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .onDelete(perform: viewModel.removeCards)
                            
                        }
                    }
                    
                }
            }
            .navigationBarTitle("Edit Cards")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Done")
                    }
                }
            }
            
        }
    }

}

struct EditCardView_Previews: PreviewProvider {
    static var previews: some View {
        EditCardView(viewModel: ViewModel())
    }
}
