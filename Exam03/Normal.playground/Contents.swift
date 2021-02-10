import UIKit

var str = "Hello, playground"
let completion: (([(index: Int, ducation: Double)]) -> Void)?
var results = [(index: Int, ducation: Double)]()

print(str)

completion = {
    print("async \($0)")
}
exec()

func exec() {
    asyncMethod(index: 1)
    asyncMethod(index: 2)
    asyncMethod(index: 3)
}

func asyncMethod(index: Int) {
    let interval = Double.random(in: 0...3)
    Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { _ in
        results.append((index, interval))
        if results.count == 3 {
            completion?(results)
        }
    }
}
