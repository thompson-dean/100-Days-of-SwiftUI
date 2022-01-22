//
//  DetailView.swift
//  Milestone10-12
//
//  Created by Dean Thompson on 2022/01/22.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: ContentViewModel
    var user: User
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .center)
                    Spacer()
                }
                
            }
            Section( header: Text("Name")) {
                Text(user.name)
                    .font(.headline)
                HStack {
                    Text(user.isActive ? "ACTIVE" : "INACTIVE")
                    Spacer()
                   Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(user.isActive ? .green : .red)
                        .padding(.trailing)
                }
            }
            
            Section( header: Text("Age")) {
                Text("\(user.age)")
                
            }
            Section( header: Text("Details")) {
                HStack {
                    Text("Company: ")
                    Spacer()
                    Text(user.company)
                }
                HStack {
                Text("Email: ")
                Spacer()
                Text(user.email)
                }
                HStack {
                Text("Address: ")
                Spacer()
                Text(user.address)
                }
            }
            Section( header: Text("About")) {
                Text(user.about)
                
            }
            Section( header: Text("Friends List")) {
                List(user.friends) { friend in
                    NavigationLink {
                        DetailView(viewModel: viewModel, user: viewModel.findUser(string: friend.id))
                    } label: {
                    Text(friend.name)
                    }
                }
                    
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: ContentViewModel(), user: User(id: "Jazz Box", isActive: true, name: "Jazz McGee", age: 32, company: "Jazz Crate", email: "jazzbox@gmail.com", address: "1234 Jazz Boulevarde, Heaps Phat, NSW, Australia", about: "Maddest dog in town. Can bop at 320 bpm, no joke", friends: [Friend(id: "Ogday", name: "Dog")]))
    }
}
