
import UIKit

print(Thread.current.description)

let repeatClosure = { (s: String) -> () in
    for i in 0...10 {
        print(s + " " + Thread.current.description)
    }
}

let r = repeatClosure

let queue = OperationQueue()

class MyOp: Operation {
    let m: String
    
    init(message: String) {
        self.m = message
    }
    override func main() {
        repeatClosure("**** \( m )  I'm in main")
    }
}

let op = MyOp(message: "Diego")
let op2 = MyOp(message: "pepe")

op2.addDependency(op)
queue.addOperation(op)
queue.addOperation(op2)

queue.addOperation {
    r("Hello")
}

print("---------------------------------------------------------")
// queue.cancelAllOperations()

queue.addOperation {
    repeatClosure("is it me")
}

queue.addOperation {
    repeatClosure("you're looking for?")
}
