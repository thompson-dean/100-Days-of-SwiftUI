//
//  ContentView.swift
//  Project14
//
//  Created by Dean Thompson on 2022/02/06.
//

import SwiftUI
import MapKit


struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        if viewModel.isUnlocked {
            ZStack {
                Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) {
                    location in
                    MapAnnotation(coordinate: location.coordinate) {
                        VStack {
                            Image(systemName: "star.circle")
                                .resizable()
                                .foregroundColor(.red)
                            //44 x 44 is the magic number. Do not go smaller than this size for interactable views.
                                .frame(width: 44, height: 44)
                                .background(.white)
                                .clipShape(Circle())
                            Text(location.name)
                                .fixedSize()
                        }
                        .onTapGesture {
                            viewModel.selectedPlace = location
                        }
                    }
                }
                .ignoresSafeArea()
                Circle()
                    .fill(.blue)
                    .opacity(0.5)
                    .frame(width: 32, height: 32)
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            viewModel.addLocation()
                        } label: {
                            Image(systemName: "plus")
                                
                        }
                        //Challenge 1 - When the modifiers are placed on the image, the target that you can tap only encompasses the image, rather then the whole button. That's why it is better place these modifiers on the button. 
                        .padding()
                        .background(.black.opacity(0.75))
                        .font(.title)
                        .clipShape(Circle())
                        .padding(.trailing)
                    
                    }
                }
                
            }
            
            .sheet(item: $viewModel.selectedPlace) { place in
                EditView(location: place) { newLocation in
                    viewModel.update(location: newLocation)
                }
            }
            .alert(isPresented: $viewModel.showAuthError) {
                Alert(title: Text(viewModel.alertTitle), message: Text(viewModel.alertMessage), dismissButton: .default(Text("Reauthenticate"), action: {
                    viewModel.authenticate()
                }))
            }
        } else {
            Button("Unlock Place") {
                viewModel.authenticate()
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
