protocol Beverage {
    func cost() -> Double
    func description() -> String
}

class Coffee: Beverage {
    func cost() -> Double {
        return 0.95
    }
    
    func description() -> String {
        return "Coffe"
    }
}

class Expresso: Beverage {
    func cost() -> Double {
        return 0.5
    }
    
    func description() -> String {
        return "Expresso"
    }
}

class Mocha: Beverage {
    let beverage: Beverage
    
    init(beverage: Beverage) {
        self.beverage = beverage
    }
    
    func cost() -> Double {
        return 0.2 + self.beverage.cost()
    }
    
    func description() -> String {
        return self.beverage.description() + ", Mocha"
    }
}

class Whip: Beverage {
    let beverage: Beverage
    
    init(beverage: Beverage) {
        self.beverage = beverage
    }
    
    func cost() -> Double {
        return 0.45 + self.beverage.cost()
    }
    
    func description() -> String {
        return self.beverage.description() + ", Whip"
    }
}

var darkRoast: Beverage = Coffee()
darkRoast = Mocha(beverage: darkRoast)
darkRoast = Mocha(beverage: darkRoast)
darkRoast = Whip(beverage: darkRoast)

darkRoast.description()
darkRoast.cost()

var expresso: Beverage = Expresso()
expresso.description()
expresso.cost()