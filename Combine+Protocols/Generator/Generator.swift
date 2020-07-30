//
//  Generator.swift
//  Combine+Protocols
//
//  Created by Daniel Bernal on 7/29/20.
//

import Foundation

protocol Generator {
    // Wrapped value
    var name: String { get }

    // Published property wrapper
    var namePublished: Published<String> { get }

     // Publisher
    var namePublisher: Published<String>.Publisher { get }
    
    func generate()
}
