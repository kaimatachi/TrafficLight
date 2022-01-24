//
//  TrafficLightViewModel.swift
//  TrafficLight
//
//  Created by Jeremy Van Cauteren on 19/01/2022.
//

import Foundation
import Combine

class TrafficLightViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var state = TrafficLightState.red
    @Published var isIterating = false
    
    let allStates = TrafficLightState.allCases
    let carModel: String
    
    private unowned let coordinator: TrafficLightCoordinatorViewModel
    private let manager = TrafficLightManager()
    
    init(coordinator: TrafficLightCoordinatorViewModel, carModel: String) {
        self.coordinator = coordinator
        self.carModel = carModel
    }
    
}

// MARK: - Fetch data

extension TrafficLightViewModel {
    
    func fetchData() {
        manager.state.assign(to: &$state)
        startIterating()
    }
    
}

// MARK: - Iterations

extension TrafficLightViewModel {
    
    func didTapIterateButton() {
        isIterating ? stopIterating() : startIterating()
    }
    
    private func startIterating() {
        manager.startIterating()
        isIterating = true
    }
    
    private func stopIterating() {
        manager.stopIterating()
        isIterating = false
    }
    
}
