//
//  ContentView-ViewModel.swift
//  Project14
//
//  Created by Dean Thompson on 2022/02/06.
//

import Foundation
import LocalAuthentication
import MapKit

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published  var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.7, longitude: 139.76), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        
        @Published private(set) var locations: [Location]
        @Published var selectedPlace: Location?
        
        @Published var isUnlocked = false
        
        @Published var showAuthError = false
        @Published var alertTitle = ""
        @Published var alertMessage = ""
        
        let savePath = FileManager.documentDirectory.appendingPathComponent("SavedPlaces")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        func addLocation() {
            let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
            
            locations.append(newLocation)
            save()
        }
        
        func update(location: Location) {
            guard let selectedPlace = selectedPlace else {return }
            
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                save()
            }
            
        }
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places."
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    if success {
                        Task { @MainActor in
                            self.isUnlocked = true
                        }
                    } else {
                        //Challenge 2
                        Task { @MainActor in
                            self.showAuthError = true
                            self.alertTitle = "Error"
                            self.alertMessage = "Error"
                        }
                    }
                }
            } else {
                //Challeng 2
                Task { @MainActor in
                    self.showAuthError = true
                    self.alertTitle = "Error"
                    self.alertMessage = "Error"
                }
            }
            
        }
        
        
    }
    
}

