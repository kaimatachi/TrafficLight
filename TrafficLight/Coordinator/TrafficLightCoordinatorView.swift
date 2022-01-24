//
//  TrafficLightCoordinatorView.swift
//  TrafficLight
//
//  Created by Jeremy Van Cauteren on 24/01/2022.
//

import SwiftUI

struct TrafficLightCoordinatorView: View {
    
    @StateObject private var coordinator = TrafficLightCoordinatorViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                CarModelView(viewModel: coordinator.carModelViewModel)
                    .navigationBarHidden(true)
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
        .environmentObject(coordinator)
    }
}

struct TrafficLightCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        TrafficLightCoordinatorView()
    }
}
