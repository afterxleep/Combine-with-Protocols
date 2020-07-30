//
//  AnimalGenerator.swift
//  Combine+Protocols
//
//  Created by Daniel Bernal on 7/29/20.
//

import Foundation

class AnimalGenerator: Generator, ObservableObject {
    
    @Published private(set) var name: String = ""
    var namePublished: Published<String> { _name }
    var namePublisher: Published<String>.Publisher { $name }
     
     let animals = ["Cat", "Dog", "Crow", "Horse", "Iguana", "Cow", "Racoon"]
    
    init() {
        generate()
    }
    
    func generate() {
        self.name = animals.randomElement() ?? ""
    }
}
