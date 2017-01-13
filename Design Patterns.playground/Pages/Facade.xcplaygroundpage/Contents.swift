class Amplifier {
    
    var dvd: DvdPlayer? = nil
    
    func on() {
        print("Amplifier on")
    }
    
    func off() {
        print("Amplifier off")
    }
    
    func setDvd(dvd: DvdPlayer) {
        print("Amplifier setting dvd player to DVD Player")
        self.dvd = dvd
    }
    
    func setSurroundSound() {
        print("Amplifier surround sound on")
    }
}

class DvdPlayer {
    func on() {
        print("DVD Player on")
    }
    
    func play() {
        print("DVD Player playing movie")
    }
    
    func stop() {
        print("DVD Player stopped")
    }
    
    func eject() {
        print("DVD Player eject")
    }
    
    func off() {
        print("DVD Player off")
    }
}

class Projector {
    func on() {
        print("Top-O-Line projector on")
    }
    
    func off() {
        print("Top-O-Line projector on")
    }
    
    func widescreen() {
        print("Top-O-Line projector in widescreen mode")
    }
}

class TheatherLights {
    func on() {
        print("Theather Lights on")
    }
    
    func off() {
        print("Theather Lights off")
    }
}

class Screen {
    func down() {
        print("Theather Screen going down")
    }
    
    func up() {
        print("Theather Screen going up")
    }
}

class PopcornPopper {
    func on() {
        print("Popcorn Popper on")
    }
    
    func pop() {
        print("Popcorn Popper popping popcorn")
    }
    
    func off() {
        print("Popcorn Popper off")
    }
}

class HomeTheatherFacade {
    let amp: Amplifier
    let dvd: DvdPlayer
    let projector: Projector
    let screen: Screen
    let lights: TheatherLights
    let popper: PopcornPopper
    
    init(amp: Amplifier, dvd: DvdPlayer, projector: Projector, screen: Screen, lights: TheatherLights, popper: PopcornPopper) {
        self.amp = amp
        self.projector = projector
        self.screen = screen
        self.lights = lights
        self.popper = popper
        self.dvd = dvd
    }
    
    func watchMovie(name: String) {
        print("Get ready to watch \(name)...")
        popper.on()
        popper.pop()
        lights.off()
        screen.down()
        projector.on()
        projector.widescreen()
        amp.on()
        amp.setDvd(dvd: dvd)
        amp.setSurroundSound()
        dvd.on()
        dvd.play()
    }
    
    func endMovie() {
        print("Shutting movie theather down...")
        popper.off()
        lights.on()
        screen.up()
        projector.off()
        amp.off()
        dvd.stop()
        dvd.eject()
        dvd.off()
    }
}

let homeTheather = HomeTheatherFacade(amp: Amplifier(), dvd: DvdPlayer(), projector: Projector(), screen: Screen(), lights: TheatherLights(), popper: PopcornPopper())
homeTheather.watchMovie(name: "Star Wars")
homeTheather.endMovie()