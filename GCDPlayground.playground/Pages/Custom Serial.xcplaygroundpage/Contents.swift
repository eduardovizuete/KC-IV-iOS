import UIKit
import Swift

// assert(Thread.current == Thread.main)
// Thread.sleep(forTimeInterval: 1000)

print("Create serial queue")

let queue = DispatchQueue(label: "serial-queue")
print(Thread.current.description)
queue.async {
    for i in 1...10 {
        print("*** task 1 \( i )  " + Thread.current.description)
    }
}

print("En main, checkpoint 1")

queue.async {
    print("task 2 " + Thread.current.description)
}

queue.async {
    print("task 3 " + Thread.current.description)
}

print("En main, checkpoint 2")

