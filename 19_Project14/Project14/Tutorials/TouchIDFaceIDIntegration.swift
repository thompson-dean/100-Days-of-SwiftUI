//
//  TouchIDFaceIDIntegration.swift
//  Project14
//
//  Created by Dean Thompson on 2022/02/06.
//

import SwiftUI
import LocalAuthentication

struct TouchIDFaceIDIntegration: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Image(systemName: "lock.open")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            } else {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    isUnlocked = true
                } else {
                    // there was an issue
                }
            }
        } else {
            // no biometrics
        }
    }
}

struct TouchIDFaceIDIntegration_Previews: PreviewProvider {
    static var previews: some View {
        TouchIDFaceIDIntegration()
    }
}
