import Foundation

let c: () -> Int = { () in
    return 3
}

let makeCounter: (String) -> ( () -> Int ) = { (s) in
    var n = 10
    
    let f: () -> Int = {
        n = n + 1
        return n
    }
    
    let f2: () -> Int = {
        n = n + n
        return n
    }
    
    let f3: () -> Int = {
        n = n * n
        return n
    }
    
    if (s == "") {
        return f2
    } else {
        return f3
    }
    
    return f
}

let c1: () -> Int = makeCounter("")
let c2 = makeCounter("a")
let c3 = makeCounter("b")

c1()

c3()
c3()

c1()
c1()
c1()

c2()
