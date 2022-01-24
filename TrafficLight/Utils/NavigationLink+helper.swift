//
//  NavigationLink+helper.swift
//  TrafficLight
//
//  Created by Jeremy Van Cauteren on 21/01/2022.
//

import Foundation
import SwiftUI

extension NavigationLink where Label == EmptyView {
    
    init(destination: Destination, isActive: Binding<Bool>) {
        self.init(destination: destination, isActive: isActive) { EmptyView() }
    }
    
}
