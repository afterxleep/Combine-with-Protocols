//
//  PersonGenerator.swift
//  Combine+Protocols
//
//  Created by Daniel Bernal on 7/29/20.
//

import Foundation

class PersonGenerator: Generator, ObservableObject {

    @Published private(set) var name: String = ""
    var namePublished: Published<String> { _name }
    var namePublisher: Published<String>.Publisher { $name }
    
     let persons = ["John", "Jane", "Carlos", "Daniel", "Helen", "David", "Bill"]
    
    init() {
        generate()
    }
    
    func generate() {
        self.name = persons.randomElement() ?? ""
    }
}
