protocol Command {
    func execute()
}

class Light {
    func on () {
        print("turn on the lights")
    }
    
    func off() {
        print("turn off the lights")
    }
}

class Stereo {
    func on() {
        print("turn on the stereo")
    }
    
    func setCD() {
        print("load CD")
    }
    
    func setVolume(volume: Int) {
        print("volume set to \(volume)")
    }
    
    func off() {
        print("Turn off the stereo")
    }
}

class LightOnCommand: Command {
    let light: Light
    
    init(light: Light) {
        self.light = light
    }
    
    func execute() {
        self.light.on()
    }
}

class LightOffCommand: Command {
    let light: Light
    
    init(light: Light) {
        self.light = light
    }
    
    func execute() {
        self.light.off()
    }
}

class StereoOnWithCDCommand: Command {
    let stereo: Stereo
    
    init(stereo: Stereo) {
        self.stereo = stereo
    }
    
    func execute() {
        self.stereo.on()
        self.stereo.setCD()
        self.stereo.setVolume(volume: 10)
    }
}

class StereoOffCommand: Command {
    let stereo: Stereo
    
    init(stereo: Stereo) {
        self.stereo = stereo
    }
    
    func execute() {
        self.stereo.off()
    }
}

class RemoteControl {
    var onCommands = [Command]()
    var offCommands = [Command]()
    
    init() {
        onCommands
    }
    
    func setCommand(inSlot: Int, onCommand: Command, offCommand: Command) {
        self.onCommands.insert(onCommand, at: inSlot)
        self.offCommands.insert(offCommand, at: inSlot)
    }
    
    func onButtonPushed(inSlot: Int) {
        onCommands[inSlot].execute()
    }
    
    func offButtonPushed(inSlot: Int) {
        offCommands[inSlot].execute()
    }
}

class RemoteLoader {
    
    let remoteControl = RemoteControl()
    
    init() {
        let livingRoomLight = Light()
        let kitchenLight = Light()
        let stereo = Stereo()
        
        let livingRoomOnCommand = LightOnCommand(light: livingRoomLight)
        let livingRoomOffCommand = LightOffCommand(light: livingRoomLight)
        let kitchenOnCommand = LightOnCommand(light: kitchenLight)
        let kitchenOffCommand = LightOffCommand(light: kitchenLight)
        let stereoWithCdCommand = StereoOnWithCDCommand(stereo: stereo)
        let stereoOffCommand = StereoOffCommand(stereo: stereo)
        
        self.remoteControl.setCommand(inSlot: 0, onCommand: livingRoomOnCommand, offCommand: livingRoomOffCommand)
        self.remoteControl.setCommand(inSlot: 1, onCommand: kitchenOnCommand, offCommand: kitchenOffCommand)
        self.remoteControl.setCommand(inSlot: 2, onCommand: stereoWithCdCommand, offCommand: stereoOffCommand)
    }
}

let remote = RemoteLoader()
remote.remoteControl.onButtonPushed(inSlot: 0)
remote.remoteControl.onButtonPushed(inSlot: 2)
remote.remoteControl.offButtonPushed(inSlot: 0)
remote.remoteControl.offButtonPushed(inSlot: 2)