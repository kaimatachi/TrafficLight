//
//  TrafficLightState.swift
//  TrafficLight
//
//  Created by Jeremy Van Cauteren on 19/01/2022.
//

import Foundation
import SwiftUI

enum TrafficLightState: CaseIterable, Equatable {
    case red
    case orange
    case green
    
    var nextState: TrafficLightState {
        switch self {
        case .red:
            return .green
        case .orange:
            return .red
        case .green:
            return .orange
        }
    }
    
    var timeToNextCase: Double {
        switch self {
        case .red:
            return 4
        case .orange:
            return 1
        case .green:
            return 4
        }
    }
    
    var color: Color {
        switch self {
        case .red:
            return Color.red
        case .orange:
            return Color.orange
        case .green:
            return Color.green
        }
    }
}

extension TrafficLightState: Identifiable {
    var id: Self { self }
}
