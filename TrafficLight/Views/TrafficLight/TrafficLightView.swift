//
//  TrafficLightView.swift
//  TrafficLight
//
//  Created by Jeremy Van Cauteren on 19/01/2022.
//

import SwiftUI

struct TrafficLightView: View {
    
    @StateObject private var viewModel: TrafficLightViewModel
    
    init(viewModel: TrafficLightViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 32) {
            ForEach(viewModel.allStates) { state in
                circle(for: state.color, isHighlighted: state == viewModel.state)
            }
            
            iterateButton
        }
        .navigationTitle(viewModel.carModel)
        .onAppear {
            viewModel.fetchData()
        }
    }
}

// MARK: - Circles

extension TrafficLightView {
    
    private func circle(for color: Color, isHighlighted: Bool) -> some View {
        Circle()
            .fill(color)
            .opacity(isHighlighted ? 1 : 0.33)
            .animation(.easeInOut, value: isHighlighted)
    }
    
}

// MARK: - Buttons

extension TrafficLightView {
    
    private var iterateButton: some View {
        Button {
            viewModel.didTapIterateButton()
        } label: {
            Text(viewModel.isIterating ? "Stop iterating" : "Start iterating")
                .foregroundColor(Color.white)
                .padding()
                .background(viewModel.isIterating ? Color.red : Color.blue)
                .clipShape(Capsule())
        }
    }
    
}

struct TrafficLightView_Previews: PreviewProvider {
    static var previews: some View {
        let coordinatorViewModel = TrafficLightCoordinatorViewModel()
        let viewModel = TrafficLightViewModel(coordinator: coordinatorViewModel, carModel: "A car model")
        TrafficLightView(viewModel: viewModel)
    }
}
