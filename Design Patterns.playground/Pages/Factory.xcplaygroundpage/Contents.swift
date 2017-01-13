enum Flavor {
    case cheese
    case pepperoni
    case veggie
}

protocol Pizza {
    func prepare()
    func bake()
    func cut()
    func box()
}

extension Pizza {
    func bake() {
        print("baking....")
    }
}

class CheesePizza: Pizza {
    
}

class PepperoniPizza: Pizza {
    
}

class VeggiePizza: Pizza {
    
}

class PizzaFactory {
    
    func createPizza(flavor: Flavor) -> Pizza {
        switch flavor {
        case .cheese:
            return CheesePizza()
        case .pepperoni:
            return PepperoniPizza()
        case .veggie:
            return VeggiePizza()
    }
}

let factory = PizzaFactory()
let pepperoni = factory.
