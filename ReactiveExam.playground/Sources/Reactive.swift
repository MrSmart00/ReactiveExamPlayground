import Foundation
import Combine

public class ReactiveMethods {

    public init() { }

    public func start() -> AnyPublisher<Void, Never> {
        let async1 = asyncSomething(with: 0)
        let async2 = asyncSomething(with: 1)
        let async3 = asyncSomething(with: 2)
        return async1.zip(async2, async3)
            .map { _ in () }
            .eraseToAnyPublisher()
    }

    func asyncSomething(with index: Int) -> AnyPublisher<Void, Never> {
        let interval = Double.random(in: 0...3)
        return Timer.publish(every: interval, on: .main, in: .default)
            .autoconnect()
            .first()
            .handleEvents(receiveOutput: { (_) in
                print("Reactive \(index): \(String(format: "%.2f", interval))")
            })
            .map { _ in () }
            .eraseToAnyPublisher()
    }
}
