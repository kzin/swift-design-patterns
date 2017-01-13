protocol Beverage {
    
    var customerWantsCondiments: Bool { get }
    
    func prepareRecipe()
    func boilWater()
    func brew()
    func pourInCup()
    func addCondiments()
}

extension Beverage {
    func prepareRecipe() {
        boilWater()
        brew()
        pourInCup()
        
        if customerWantsCondiments {
            addCondiments()
        }
    }
    
    func boilWater() {
        print("Boiling water")
    }
    
    func pourInCup() {
        print("Pouring into cup")
    }
}

class Tea: Beverage {
    
    var condiments: Bool = false
    var customerWantsCondiments: Bool {
        get {
            return condiments
        }
    }
    
    init(wantCondiment: Bool) {
        condiments = wantCondiment
    }
    
    func brew() {
        print("Steeping the tea")
    }
    
    func addCondiments() {
        print("Adding Lemon")
    }
}

class Coffee: Beverage {
    
    var condiments: Bool = false
    var customerWantsCondiments: Bool {
        get {
            return condiments
        }
    }
    
    init(wantCondiment: Bool) {
        condiments = wantCondiment
    }
    
    func brew() {
        print("Dripping coffee through filter")
    }
    
    func addCondiments() {
        print("Adding sugar and milk")
    }
}

let tea = Tea(wantCondiment: true)
tea.prepareRecipe()

let coffee = Coffee(wantCondiment: false)
coffee.prepareRecipe()
