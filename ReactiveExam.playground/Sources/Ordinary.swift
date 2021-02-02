import Foundation

public class OrdinaryMethods {
    var completion: (() -> Void)?
    var results: [Int]

    public init() {
        results = []
    }

    public func start(completion: @escaping () -> Void) {
        self.completion = completion
        asyncSomething(with: 0)
        asyncSomething(with: 1)
        asyncSomething(with: 2)
    }

    func asyncSomething(with index: Int) {
        let interval = Double.random(in: 0...3)
        Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { [weak self] (_) in
            print("Ordinary \(index): \(String(format: "%.2f", interval))")
            self?.results.append(index)
            if self?.results.count == 3 {
                self?.completion?()
            }
        }
    }
}
