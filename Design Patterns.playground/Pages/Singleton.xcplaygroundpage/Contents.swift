class User {
    var name: String
    var age: Int
    
    static let sharedInstance = User()
    
    private init(){
        name = "Singleton"
        age = 20
    }
    
}

let user = User.sharedInstance
user.name
user.age