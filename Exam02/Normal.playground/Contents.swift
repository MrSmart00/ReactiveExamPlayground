import UIKit

var str = "Hello, playground"
let completion: ((Int) -> Void)?

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
    Timer.scheduledTimer(withTimeInterval: Double.random(in: 0...3), repeats: false) { _ in
        completion?(index)
    }
}
