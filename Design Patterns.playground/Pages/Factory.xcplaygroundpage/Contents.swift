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
    func prepare() {
        
    }
    
    func bake() {
        print("Baking for 25 minutes at 150")
    }
    
    func cut() {
        print("Cutting the pizza into diagonal slices")
    }
    
    func box() {
        print("Place pizza in official PizzaStore box")
    }
}

class CheesePizza: Pizza {
    func prepare() {
        print("Preparing Cheese Pizza")
        print("Tossing dough...")
        print("Adding cheese...")
    }
}

class PepperoniPizza: Pizza {
    func prepare() {
        print("Preparing Pepperoni Pizza")
        print("Tossing dough...")
        print("Adding cheese...")
        print("Adding pepperoni...")
    }
}

class VeggiePizza: Pizza {
    func prepare() {
        print("Preparing Veggie Pizza")
        print("Tossing dough...")
        print("Adding cheese...")
        print("Adding veggies...")
    }
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
}


class PizzaStore {
    let pizzaFactory = PizzaFactory()
    
    func orderPizza(flavor: Flavor) {
        let pizza = pizzaFactory.createPizza(flavor: flavor)
        
        pizza.prepare()
        pizza.bake()
        pizza.cut()
        pizza.box()
    }
}

let pizzaStore = PizzaStore()
pizzaStore.orderPizza(flavor: .cheese)
pizzaStore.orderPizza(flavor: .pepperoni)
pizzaStore.orderPizza(flavor: .veggie)
