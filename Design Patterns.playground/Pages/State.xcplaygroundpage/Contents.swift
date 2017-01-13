/*
 
 enum State {
    case has_quarter
    case sold
    case sold_out
    case no_quarter
 }
 
 class GumballMachine {
    let state : State = .sold_out
 }
 
 */

class GumballMachine {
    let soldOutState: State = SoldOut()
    let noQuarterState: State = NoQuarter()
    let hasQuarterState: State = HasQuarter()
    let soldState: State = Sold()
    
    var currentState: State
    var count = 0
    
    init(numberOfBalls: Int) {
        currentState = soldOutState
        
        if numberOfBalls > 0 {
            count = numberOfBalls
            currentState = noQuarterState
        }
    }
    
    func setup() {
        soldOutState.setMachine(gumballMachine: self)
        noQuarterState.setMachine(gumballMachine: self)
        hasQuarterState.setMachine(gumballMachine: self)
        soldState.setMachine(gumballMachine: self)
    }
    
    func insertQuarter() {
        currentState.insertQuarter()
    }
    
    func ejectQuarter() {
        currentState.ejectQuarter()
    }
    
    func turnCrank() {
        currentState.turnCrank()
        currentState.dispense()
    }
    
    func releaseBall() {
        print("A gumball comes rolling out the slot...")
        if count != 0 {
            count = count - 1
        }
    }
}

protocol State {
    func insertQuarter()
    func ejectQuarter()
    func turnCrank()
    func dispense()
    func setMachine(gumballMachine: GumballMachine)
}

class NoQuarter: State {
    var gumballMachine: GumballMachine? = nil
    
    func setMachine(gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }
    
    func insertQuarter() {
        print("You inserted a quarter")
        if let state = self.gumballMachine?.hasQuarterState {
            self.gumballMachine?.currentState = state
        }
    }
    
    func ejectQuarter() {
        print("You haven't inserted a quarter")
    }
    
    func turnCrank() {
        print("You turned, but there's no quarter")
    }
    
    func dispense() {
        print("You need to pay first")
    }
}

class SoldOut: State {
    var gumballMachine: GumballMachine? = nil
    
    func setMachine(gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }
    
    func insertQuarter() {
        print("You inserted a quarter")
    }
    
    func ejectQuarter() {
        print("You haven't inserted a quarter")
    }
    
    func turnCrank() {
        print("You turned, but there's no quarter")
    }
    
    func dispense() {
        print("You need to pay first")
    }
}

class Sold: State {
    var gumballMachine: GumballMachine? = nil
    
    func setMachine(gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }
    
    func insertQuarter() {
        print("Please wait, we're already giving you a gumball")
    }
    
    func ejectQuarter() {
        print("Sorry, you already turned the crank")
    }
    
    func turnCrank() {
        print("Turning twice doesn't get you another gumball")
    }
    
    func dispense() {
        self.gumballMachine?.releaseBall()
        if let count = self.gumballMachine?.count, count > 0 {
            if let state = self.gumballMachine?.noQuarterState {
                self.gumballMachine?.currentState = state
            }
        } else {
            print("Oops, out of gumballs")
            if let state = self.gumballMachine?.soldOutState {
                self.gumballMachine?.currentState = state
            }
        }
    }
}

class HasQuarter: State {
    var gumballMachine: GumballMachine? = nil
    
    func setMachine(gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }
    
    func insertQuarter() {
        print("You can't insert another quarter")
    }
    
    func ejectQuarter() {
        print("Quarter returned")
        if let state = self.gumballMachine?.noQuarterState {
            self.gumballMachine?.currentState = state
        }
    }
    
    func turnCrank() {
        print("You turned...")
        if let state = self.gumballMachine?.soldState {
            self.gumballMachine?.currentState = state
        }
    }
    
    func dispense() {
        print("No gumball dispensed")
    }
}

let gumballMachine = GumballMachine(numberOfBalls: 2)
gumballMachine.setup()
gumballMachine.insertQuarter()
gumballMachine.turnCrank()
gumballMachine.insertQuarter()
gumballMachine.turnCrank()
gumballMachine.insertQuarter()
gumballMachine.turnCrank()