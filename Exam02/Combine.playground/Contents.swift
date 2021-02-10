import UIKit
import Combine

var str = "Hello, playground"
var cancellables = Set<AnyCancellable>()

print(str)
exec()

func exec() {
    let async1 = asyncMethod(index: 1)
    let async2 = asyncMethod(index: 2)
    let async3 = asyncMethod(index: 3)
    async1
        .merge(with: async2, async3)
        .sink {
            print("async \($0)")
        }
        .store(in: &cancellables)
}

func asyncMethod(index: Int) -> AnyPublisher<Int, Never> {
    Timer.publish(every: Double.random(in: 0...3), on: .main, in: .default)
        .autoconnect()
        .first()
        .map { _ in index }
        .eraseToAnyPublisher()
}
