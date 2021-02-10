import UIKit

var str = "Hello, playground"

print(str)
exec()

func exec() {
    asyncMethod { print("Completion") }
}

func asyncMethod(completion: @escaping () -> Void) {
    Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
        completion()
    }
}
