import UIKit
import Combine

let ordinary = OrdinaryMethods()

ordinary
    .start {
        print("Completed Ordinary Methods")
    }

let reactive = ReactiveMethods()
var cancellables = Set<AnyCancellable>()

reactive
    .start()
    .sink { (_) in
        print("Completed Reactive Methods")
    }
    .store(in: &cancellables)
