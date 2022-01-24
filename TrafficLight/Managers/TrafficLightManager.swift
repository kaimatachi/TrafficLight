//
//  TrafficLightManager.swift
//  TrafficLight
//
//  Created by Jeremy Van Cauteren on 19/01/2022.
//

import Foundation
import Combine

class TrafficLightManager {
    
    // MARK: - Properties
    private(set) var state = CurrentValueSubject<TrafficLightState, Never>(TrafficLightState.red)
    private var timerCancellable: AnyCancellable?
    
}

// MARK: - Iterations

extension TrafficLightManager {
    
    func startIterating() {
        timerCancellable = Timer.publish(every: state.value.timeToNextCase, on: .main, in: .default)
            .autoconnect()
            .sink(receiveValue: { [weak self] _ in
                guard let self = self else { return }
                
                let previousState = self.state.value
                self.state.value = self.state.value.nextState
                
                if previousState.timeToNextCase != self.state.value.timeToNextCase {
                    self.stopIterating()
                    self.startIterating()
                }
            })
    }
    
    func stopIterating() {
        timerCancellable?.cancel()
    }
    
}
