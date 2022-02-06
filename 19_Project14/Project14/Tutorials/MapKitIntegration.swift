//
//  MapKitIntegration.swift
//  Project14
//
//  Created by Dean Thompson on 2022/02/06.
//

import SwiftUI
import MapKit

//struct Location: Identifiable {
//    let id = UUID()
//    let name: String
//    let coordinate: CLLocationCoordinate2D
//}
//struct MapKitIntegration: View {
//    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.7, longitude: 139.76), span: MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25))
//    
//    let locations = [
//    Location(name: "皇居", coordinate: CLLocationCoordinate2D(latitude: 35.6852, longitude: 139.7528)),
//    Location(name: "豪徳寺", coordinate: CLLocationCoordinate2D(latitude: 35.6537392, longitude: 139.6451718)),
//    ]
//    
//    var body: some View {
//        NavigationView {
//            Map(coordinateRegion: $mapRegion, annotationItems: locations) {
//                location in
//                MapAnnotation(coordinate: location.coordinate) {
//                    
//                    
//                    if location.name == "皇居" {
//                        Image(systemName: "camera.fill")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 30, height: 30)
//                            
//                    } else {
//                        Image(systemName: "house.fill")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 30, height: 30)
//                    }
//                    NavigationLink {
//                        Text(location.name)
//                    } label: {
//                        Text(location.name)
//                    }
//                    
//                    
//                }
//            }
//        }
//    }
//}
//
//struct MapKitIntegration_Previews: PreviewProvider {
//    static var previews: some View {
//        MapKitIntegration()
//    }
//}
