import UIKit

var str = "Hello, playground"

print(str)
exec()

func exec() {
    asyncMethod(index: 1) {
        print("async \($0)")
        asyncMethod(index: 2) {
            print("async \($0)")
        }
    }
}

func asyncMethod(index: Int, completion: @escaping (Int) -> Void) {
    Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
        completion(index)
    }
}
