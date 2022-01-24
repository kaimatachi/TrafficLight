//
//  CarModelViewModel.swift
//  TrafficLight
//
//  Created by Jeremy Van Cauteren on 21/01/2022.
//

import Foundation
import Combine

class CarModelViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var carModel = ""
    @Published var shouldShowError = false
    @Published var pushTrafficLightView = false
    
}

// MARK: - Check fields

extension CarModelViewModel {
    
    func didTapStartDrivingButton() {
        if carModel.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            shouldShowError = true
        } else {
            shouldShowError = false
            pushTrafficLightView = true
        }
    }
    
}
