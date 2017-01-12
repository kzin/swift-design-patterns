import Foundation

protocol Quackable {
    func quack() -> String
}

protocol Flyable {
    func fly() -> String
}

class Duck: Quackable, Flyable {
    
    func quack() -> String {
        return "quack"
    }
    
    func fly() -> String {
        return "flying with wings"
    }
}

class Rocket: Flyable {
    func fly() -> String {
        return "flying with rockets"
    }
}

class RubberDuck: Quackable {
    func quack() -> String {
        return "squeshhh"
    }
}

let d1 = Duck()
d1.quack()

let r1 = Rocket()
r1.fly()

let d2 = RubberDuck()
d2.quack()