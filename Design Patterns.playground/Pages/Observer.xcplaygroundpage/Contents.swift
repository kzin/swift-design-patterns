import Foundation

protocol Observable {
    func registerObserver(observer: Observer)
    func removeObserver(observer: Observer)
    func notifyObservers()
}

protocol Observer{
    func update(value: Float)
}

class WeatherData: Observable {
    
    var observers: [Observer] = []
    
    var temperature: Float = 0.0 {
        didSet {
            notifyObservers()
        }
    }
    
    func registerObserver(observer: Observer) {
        self.observers.append(observer)
    }
    
    func removeObserver(observer: Observer) {
        // remove observer from self.observers
    }
    
    func notifyObservers() {
        for observer in observers {
            observer.update(value: self.temperature)
        }
    }
}

class WeatherDisplay: Observer {
    func update(value: Float) {
        print ("new temperature registered: \(value)F")
    }
}

class WeatherStation {
    let data = WeatherData()
    let display = WeatherDisplay()
    
    init() {
        data.registerObserver(observer: display)
    }
    
    func sunnyDay() {
        data.temperature = 104
    }
    
    func coldDay() {
        data.temperature = 32
    }
}

let station = WeatherStation()
station.sunnyDay()

class AnotherWeatherDisplay: Observer {
    func update(value: Float) {
        print("a new display registered: \(value)F")
    }
}

let newDisplay = AnotherWeatherDisplay()
station.data.registerObserver(observer: newDisplay)

station.coldDay()
