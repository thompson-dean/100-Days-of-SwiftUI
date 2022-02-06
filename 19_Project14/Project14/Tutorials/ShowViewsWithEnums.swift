//
//  ShowViewsWithEnums.swift
//  Project14
//
//  Created by Dean Thompson on 2022/02/06.
//

import SwiftUI
enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}
struct ShowViewsWithEnums: View {
    var loadingState = LoadingState.success
    
    var body: some View {
        switch loadingState {
        case .loading:
            LoadingView()
        case .success:
            SuccessView()
        case .failed:
            FailedView()
        }
                    
    }
}

struct ShowViewsWithEnums_Previews: PreviewProvider {
    static var previews: some View {
        ShowViewsWithEnums()
    }
}
