class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func WhenIm64() -> String {
        
        var years: Int = 64 - self.age
        
        return "\(self.name) will be 64 in \(years) years"
    }
}

var me = Person(name: "Dom", age: 19)

print(me.WhenIm64())
