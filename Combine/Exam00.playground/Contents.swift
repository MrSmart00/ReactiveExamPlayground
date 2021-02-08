import UIKit
import Combine

var str = "Hello, playground"
var cancellables = Set<AnyCancellable>()

print(str)
exec()

func exec() {
    asyncMethod()
        .sink { print("Completion") }
        .store(in: &cancellables)
}

func asyncMethod() -> AnyPublisher<Void, Never> {
    Timer.publish(every: 3, on: .main, in: .default)
        .autoconnect()
        .first()
        .map { _ in () }
        .eraseToAnyPublisher()
}
