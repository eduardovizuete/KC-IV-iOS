import Foundation

let concurrentQueue = DispatchQueue(label: "io.keepcoding.concurrent", attributes: DispatchQueue.Attributes.concurrent)

print("Beginning")

concurrentQueue.async {
    for i in 1...10 {
        print("*** task 1 \( i )  " + Thread.current.description)
        
        DispatchQueue.main.async {
            print("hola desde background \( i )")
        }
    }
}

print("Middle")

concurrentQueue.async {
    for i in 1...10 {
        print("--- task 2 \( i )  " + Thread.current.description)
    }
}


print("End")