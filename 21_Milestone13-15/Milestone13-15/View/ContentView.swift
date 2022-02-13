//
//  ContentView.swift
//  Milestone13-15
//
//  Created by Dean Thompson on 2022/02/09.
//

import SwiftUI

struct ContentView: View {
    let colors = Colors()
    
    @State var showPhotoPicker = false
    @StateObject var viewModel = ViewModel()
    @State var editIsOn = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    let layout = [ GridItem(), GridItem()]
    
    var body: some View {
        NavigationView {
            ZStack {
                colors.darkestColor
                    .ignoresSafeArea()
                
                ScrollView {
                    LazyVGrid(columns: layout, spacing: 20) {
                        ForEach(Array(zip(viewModel.posts.indices, viewModel.posts)), id: \.0) { index, post in
                            
                            GridCellView(viewModel: viewModel, editIsOn: $editIsOn, image: post.persistedImage, index: [index], latitude: post.latitude, longitude: post.longitude, name: post.name, description: post.description, id: post.id
                            )
                        }
                    }
                    .padding(10)
                    
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink {
                            AddView(viewModel: viewModel)
                            
                        } label: {
                            Image(systemName: "plus")
                                .font(.largeTitle)
                            //                        .resizable()
                                .frame(width: 25, height: 25)
                                .padding(22)
                        }
                        .background(colors.lightestColor)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                    }
                    .padding(.trailing, 25)
                }
                
                
            }
            
            .toolbar {
                if !editIsOn {
                    Button("Edit") {
                        editIsOn = true
                    }
                } else {
                    Button("Done") {
                        editIsOn = false
                    }
                }
                
            }
            .navigationTitle("Image Collector")
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
