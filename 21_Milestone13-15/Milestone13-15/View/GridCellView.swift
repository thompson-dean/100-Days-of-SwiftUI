//
//  ListCellView.swift
//  Milestone13-15
//
//  Created by Dean Thompson on 2022/02/09.
//

import SwiftUI

struct GridCellView: View {
    @ObservedObject var viewModel: ViewModel
    @State var alertIsShown = false
    @Binding var editIsOn: Bool
    let width = UIScreen.main.bounds.width / 2
    
    let colors = Colors()
    var image = UIImage()
    var index: IndexSet
    var latitude: Double
    var longitude: Double
    var name: String
    var description: String
    var id: UUID
    
    var body: some View {
        
        NavigationLink {
            DetailView(viewModel: viewModel, id: id, latitude: latitude, longitude: longitude, image: image, name: name, description: description)
        } label: {
            
            if !editIsOn {
                VStack(alignment: .center) {
                    
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 130)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .clipped()
                        .padding()
                    Spacer()
                    VStack(alignment: .center) {
                        Text(name)
                            .font(.title3)
                            .fontWeight(.heavy)
                            .padding([.horizontal, .bottom])
                        
                        
                    }
                    Spacer()
                }
                .frame(width: width - 20 , height: width + 30)
                .background(colors.secondDarkestColor)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal)
            } else {
                ZStack {
                    VStack(alignment: .center) {
                        
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 130)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .clipped()
                            .padding()
                        Spacer()
                        VStack(alignment: .center) {
                            Text(name)
                                .font(.headline)
                                .padding([.horizontal, .bottom])
                            
                            
                        }
                        
                        
                        Spacer()
                    }
                    .opacity(0.3)
                    
                    Button {
                        alertIsShown = true
                    } label: {
                        Image(systemName: "trash.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.red)
                            .frame(width: 50, height: 50)
                            
                        
                    }
                    
                }
                
                .frame(width: width - 20 , height: width + 30)
                .background(colors.secondDarkestColor)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal)
                .alert(isPresented: $alertIsShown) {
                    Alert(title: Text("Delete Post"), message: Text("Are you sure you want to delete?"), dismissButton: .default(Text("OK"), action: {
                        viewModel.delete(offsets: index)
                        editIsOn = false
                    }))
                }
                
                
            }
            
        }
        .foregroundColor(.white)
    }
    
        
    
}


