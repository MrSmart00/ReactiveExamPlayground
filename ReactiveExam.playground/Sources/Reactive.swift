import Foundation
import Combine

public class ReactiveMethods {
    var cancellables = Set<AnyCancellable>()

    public init() { }

    public func start() -> Future<Void, Never> {
        return .init { [unowned self] (promise) in
            let async1 = asyncSomething(with: 0)
            let async2 = asyncSomething(with: 1)
            let async3 = asyncSomething(with: 2)
            async1.zip(async2, async3)
                .sink { (_) in
                    promise(.success(()))
                }
                .store(in: &self.cancellables)
        }
    }

    func asyncSomething(with index: Int) -> Future<Void, Never> {
        let interval = Double.random(in: 0...3)
        return .init { [unowned self] (promise) in
            Timer.publish(every: interval, on: .main, in: .default)
                .autoconnect()
                .first()
                .sink { _ in
                    print("Reactive \(index): \(String(format: "%.2f", interval))")
                    promise(.success(()))
                }
                .store(in: &self.cancellables)
        }
    }
}
