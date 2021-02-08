import UIKit
import Combine

var str = "Hello, playground"
var cancellables = Set<AnyCancellable>()

let async1 = asyncMethod(index: 1)
let async2 = asyncMethod(index: 2)

print(str)
exec()

func exec() {
    async1
        .append(async2)
        .sink {
            print("async \($0)")
        }
        .store(in: &cancellables)
}

func asyncMethod(index: Int) -> AnyPublisher<Int, Never> {
    Timer.publish(every: 3, on: .main, in: .default)
        .autoconnect()
        .first()
        .map { _ in index }
        .eraseToAnyPublisher()
}
