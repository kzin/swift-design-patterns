protocol Duckable {
    func quack()
    func fly()
}

class Donald: Duckable {
    func quack() {
        print("quackk")
    }
    
    func fly() {
        print("I'm flying")
    }
}

protocol Turkable {
    func gobble()
    func fly()
}

class Turkey: Turkable {
    func gobble() {
        print("gobble goble")
    }
    
    func fly() {
        print("I'm flying for a short distance")
    }
}

class TurkeyAdapter: Duckable {
    let turkey: Turkable
    
    init(turkey: Turkable) {
        self.turkey = turkey
    }
    
    func quack() {
        turkey.gobble()
    }
    
    func fly() {
        turkey.fly()
    }
}

let donald = Donald()
donald.quack()

let turkey = Turkey()
turkey.gobble()

let duck = TurkeyAdapter(turkey: turkey)
duck.quack()