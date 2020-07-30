//
//  ContentView.swift
//  Combine+Protocols
//
//  Created by Daniel Bernal on 7/29/20.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.textToShow).font(.system(.largeTitle)).padding()
            Button("Tap me", action: { self.viewModel.generate() })
        }
    }
}
