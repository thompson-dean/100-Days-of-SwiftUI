//
//  AddMapView.swift
//  Milestone13-15
//
//  Created by Dean Thompson on 2022/02/12.
//

import CoreLocationUI
import CoreLocation
import SwiftUI
import MapKit

struct MapView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ViewModel
    
   
    
    var colors = Colors()
    
    
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.mapRegion, showsUserLocation: true)
            Circle()
                .fill(.blue)
                .opacity(0.5)
                .frame(width: 30, height: 30)
            VStack {
                Spacer()
                
                HStack {
                    
                }
            
            }
        }
        
        
    }
}







