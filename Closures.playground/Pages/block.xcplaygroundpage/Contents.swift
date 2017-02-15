import Foundation

let l = 10

let closure: () -> () = {
    for i in 0...l {
        print(i)
    }
}

// closure()
// closure()

let block = closure

block()

let newNumber: (Int) -> (Int) = { (n: Int) in
    return n*10
}

newNumber(25)
newNumber(5)

typealias 😉 = Bool
let b: 😉 = true

typealias 🌩 = (String, String) -> String

let concatName: 🌩 = { (s1: String, s2: String) in
    return s1 + s2
}

let concatName2 = { (s1: String, s2: String) in
    return s1 + s2
}

let concatName3 = { (s1: String, s2: String) in
    s1 + s2
}

concatName3("Hola", " Mundo!")

let _ = {
    var secret = 10
    print("Hola")
}()


let x: () -> (Int, Int) = {
    print("Estoy en x")
    
    return (10, 8)
}

x().0
x().1

let y: (Int, Int) = {
    print("Estoy en x")
    
    return (10, 8)
}()

















