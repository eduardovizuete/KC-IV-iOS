import Foundation

func add(n1: Int, n2: Int) -> Int {
    return n1 + n2
}

func firstOrderExample(f: (Int, Int) -> Int) {
    let n = f(10, 20)
    print(n)
}

// using trailing closure
firstOrderExample { (n1: Int, n2: Int) -> Int in
    n1 - n2
}

firstOrderExample(f: add)   // using func name

let addClosure: (Int, Int) -> Int = { (n1: Int, n2: Int) in
    return n1 + n2
}
let addClosure2 = addClosure

addClosure(10, 40)

firstOrderExample(f: addClosure)    // using a named closure
firstOrderExample(f: addClosure2)    // using a named closure

// 1st order functions: MAP

let basket = ["🍏", "🍎", "🍐", "🍋", "🍌", "🍌"]

basket.map({ (e: String) -> String in
    return "🍴" + e
})

basket.map { (e: String) -> String in
    "🍴" + e
}

basket.map { (e) -> String in
    "🍴" + e
}

basket.map { (e) in
    "🍴" + e
}

let a: [String] = basket.map {
    "🍴" + $0
}

func pelar(s: String) -> String {
    return "🍴" + s
}

func comer(s: String) -> String {
    return "💩"
}

basket.map(pelar).map(comer).map(pelar)
basket

// MAP == SQL UPDATE 

// FILTER == SQL SELECT

basket.filter {
    $0=="🍌"
}

basket

let r = basket.filter {
    $0=="🍌"
    }.map(pelar).map(comer).filter {$0 == "💩"}
r

let numbers = [82, 28, 8, 872, 72]
let n = numbers.map {$0 * 2}.reduce(0, +)

numbers.reduce(1, *)
n

[1, 2].reduce(-3, +)

[1, 2, 4, 5, 1].sorted()
[1, 2, 4, 5, 1].sorted { (n1: Int, n2: Int) -> Bool in
    n1 > n2
}

[1, 2, 4, 5, 1].sorted {
    $0 > $1
    }.map { $0 * 2 }

let array = [[2, 3], [2], [], [4,5]]
let z = array.flatMap {$0}.map {$0 + 2 }
z


