import PlaygroundSupport

import SwiftUI
import Combine


protocol Generator {
    // Wrapped value
    var name: String { get }

    // Published property wrapper
    var namePublished: Published<String> { get }

     // Publisher
    var namePublisher: Published<String>.Publisher { get }
    
    func generate()
}


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

class TheViewModel: ObservableObject {
    
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

struct TheView: View {
    
    @ObservedObject var viewModel: TheViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.textToShow).font(.system(.largeTitle)).padding()
            Button("Tap me", action: { self.viewModel.generate() })
        }
    }
}

let personGenerator = PersonGenerator()
let viewModel = TheViewModel(generator: personGenerator)

PlaygroundPage.current.setLiveView(
    TheView(viewModel: viewModel)
)
