//
//  EditView-ViewModel.swift
//  Project14
//
//  Created by Dean Thompson on 2022/02/06.
//

import Foundation
//Challenge 3 (I didn't move everything from EditView over just one function and the enum).
extension EditView {
    @MainActor class ViewModel: ObservableObject {
        @Published var loadingState = LoadingState.loading
        @Published var pages = [Page]()
        
        enum LoadingState {
            case loading, loaded, failed
        }

        func fetchNearbyPlaces(_ urlString: String) async {
            
            guard let url = URL(string: urlString) else {
                print("Bad URL: \(urlString)")
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let items = try JSONDecoder().decode(Result.self, from: data)
                pages = items.query.pages.values.sorted()
                loadingState = .loaded
            } catch {
                loadingState = .failed
            }
            
            
        }

    }
}
