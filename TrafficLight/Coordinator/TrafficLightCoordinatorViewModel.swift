//
//  TrafficLightCoordinatorViewModel.swift
//  TrafficLight
//
//  Created by Jeremy Van Cauteren on 24/01/2022.
//

import Foundation
import Combine

class TrafficLightCoordinatorViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var pushTrafficLight = false
    
    var carModelViewModel: CarModelViewModel!
    var trafficLightViewModel: TrafficLightViewModel?
    
    init() {
        self.carModelViewModel = CarModelViewModel(coordinator: self)
    }
    
}

// MARK: - Navigation

extension TrafficLightCoordinatorViewModel {
    
    func openTrafficLight(carModel: String) {
        trafficLightViewModel = TrafficLightViewModel(coordinator: self, carModel: carModel)
        pushTrafficLight = true
    }
    
    var trafficLightView: TrafficLightView? {
        if let trafficLightViewModel = trafficLightViewModel {
            return TrafficLightView(viewModel: trafficLightViewModel)
        }
        return nil
    }
    
}
