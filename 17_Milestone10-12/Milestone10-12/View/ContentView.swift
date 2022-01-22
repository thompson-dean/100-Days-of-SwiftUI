//
//  ContentView.swift
//  Milestone10-12
//
//  Created by Dean Thompson on 2022/01/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.users, id: \.id) { user in
                HStack  {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    NavigationLink {
                        DetailView(viewModel: viewModel, user: user)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text(user.company)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.leading)
                    }
                }
            }
            .navigationTitle("FriendFace")
            .onAppear {
                viewModel.fetch()
            }
        }
        
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
