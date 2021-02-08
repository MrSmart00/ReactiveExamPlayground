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
        .zip(async2, async3)
        .sink {
            print("async \($0)")
        }
        .store(in: &cancellables)
}

func asyncMethod(index: Int) -> AnyPublisher<(index: Int, ducation: Double), Never> {
    let interval = Double.random(in: 0...3)
    return Timer.publish(every: interval, on: .main, in: .default)
        .autoconnect()
        .first()
        .map { _ in (index, interval) }
        .eraseToAnyPublisher()
}
