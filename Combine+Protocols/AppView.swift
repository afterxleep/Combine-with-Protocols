//
//  Combine_ProtocolsApp.swift
//  Combine+Protocols
//
//  Created by Daniel Bernal on 7/29/20.
//

import SwiftUI

@main
struct AppView: App {
    
    let personGenerator = PersonGenerator()
    let animalGenerator = AnimalGenerator()
    var viewModel: MainViewModel
    
    init() {
        self.viewModel = MainViewModel(generator: personGenerator)
    }
        
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: viewModel)
        }
    }
}
