//
//  CarModelView.swift
//  TrafficLight
//
//  Created by Jeremy Van Cauteren on 19/01/2022.
//

import SwiftUI

struct CarModelView: View {
    
    @StateObject private var viewModel = CarModelViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                VStack(spacing: 60) {
                    VStack(alignment: .leading) {
                        Text("Which car model are you driving on ?")
                        
                        TextField("Citroen C3", text: $viewModel.carModel)
                            .padding(4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.gray, lineWidth: 0.5)
                            )
                        
                        if viewModel.shouldShowError {
                            Text("Please enter you car model")
                                .foregroundColor(Color.red)
                                .font(.callout)
                        }
                    }
                    .animation(.easeInOut, value: viewModel.shouldShowError)
                    
                    Button {
                        viewModel.didTapStartDrivingButton()
                    } label: {
                        Text("Start driving")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Capsule())
                    }
                }
                
                NavigationLink(destination: TrafficLightView(carModel: viewModel.carModel), isActive: $viewModel.pushTrafficLightView)
            }
            .padding()
            .navigationBarHidden(true)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ModelCarView_Previews: PreviewProvider {
    static var previews: some View {
        CarModelView()
    }
}
