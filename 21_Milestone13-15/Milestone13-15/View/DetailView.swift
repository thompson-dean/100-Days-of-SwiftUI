//
//  DetailView.swift
//  Milestone13-15
//
//  Created by Dean Thompson on 2022/02/09.
//

import SwiftUI
import MapKit
import CoreLocation

struct DetailView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    let colors = Colors()
    
    var id: UUID
    var latitude: Double
    var longitude: Double
    var image: UIImage
    var name: String
    var description: String
    
    let width = UIScreen.main.bounds.width
    
        var body: some View {
        
        ZStack {
            
            colors.darkestColor
                .ignoresSafeArea(.all)
            
            ScrollView {
                VStack {
                    Text(name)
                        .font(.title2)
                        .fontWeight(.heavy)
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                        
                    Text(description)
                        .padding(.horizontal)
                        .padding(.bottom, 30)
                    
                    Spacer()
                    
                    Text("Location")
                        .font(.title2)
                        .fontWeight(.heavy)

                    Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: viewModel.posts) { post in
                        
                            MapMarker(coordinate: post.coordinate)
                    }
                    .frame(width: width - 40 , height: 300)
                    .cornerRadius(10)
                    
                    
                    
                }
                .foregroundColor(.white)
                .padding()
                
            }
           
            
        }
       
        
    }
}

