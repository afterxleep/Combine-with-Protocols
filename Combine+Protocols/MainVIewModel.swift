//
//  VIewModel.swift
//  Combine+Protocols
//
//  Created by Daniel Bernal on 7/29/20.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    
    @Published var textToShow: String = "No data"
    var generator: Generator
    var cancellable: AnyCancellable?
    
    init(generator: Generator) {
        self.generator = generator
        cancellable =
            generator
                .namePublisher
                .receive(on: RunLoop.main)
                .sink { [weak self] data in
                    self?.textToShow = data
            }
    }
    
    func generate() {
        generator.generate()
    }
}
