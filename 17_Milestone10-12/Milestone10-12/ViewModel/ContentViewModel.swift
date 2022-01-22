//
//  ContentViewModel.swift
//  Milestone10-12
//
//  Created by Dean Thompson on 2022/01/22.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var users = [User]()
    
    func fetch() {
        
        let urlString = "https://www.hackingwithswift.com/samples/friendface.json"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print("Unable to fetch \(error?.localizedDescription ?? "Unkown Error")")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([User].self, from: data)
                
                DispatchQueue.main.async { [weak self] in
                    self?.users = decoded
                }
            } catch {
                print("Unable to decode: \(error.localizedDescription)")
            }
        }
        task.resume()
        }
    
    func findUser(string: String) -> User {
        guard let firstUser = self.users.first(where: { (oneUser) -> Bool in
            oneUser.id == string
        }) else {
            return self.users.first!
            
        }
        return firstUser
    }
}
