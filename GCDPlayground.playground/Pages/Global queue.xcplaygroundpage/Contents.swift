import Foundation

DispatchQueue.global(qos: .background).async {
    for i in 1...10 {
        print("+++ task 3 \( i )  " + Thread.current.description)
    }
}

DispatchQueue.global().async(execute: { () -> Void in
    print("Hola")
    
    for i in 1...10 {
        print("--- task 1 \( i )  " + Thread.current.description)
    }
})

DispatchQueue.global().async(execute: { () -> Void in
    print("Hola de task 2")
    
    DispatchQueue.global().sync {
        print("En task 2 ------------------")
    }

    for i in 1...10 {
        print("**** task 2 \( i )  " + Thread.current.description)
    }
    
})

DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async {
    for i in 1...10 {
        print(">>> task 4 \( i )  " + Thread.current.description)
    }
}

