import UIKit

//-------------------------------------------
//Ornek 1: class, property
//Swift'te array'in eleman sayısına bakmak için kullandığımız count'un instance property olduğunu ve sınıf, struct gibi yapılarla birlikte kullanıldıgını gördüm. Python'da aynı işlev len() fonksiyonu ile yapılıyor. Bu durumda aynı işlevin computed property (var count: Int { get }) olarak tanımlanmasıyla direkt method/fonksiyon olarak tanımlanması arasındaki fark nedir?
 
//Alttaki örnekte count'la aynı işleve sahip bir property(numberOfItems) oluşturmaya çalıştım.
 
class ornekClass {
     
    private var count: Int = 0
    var list: [String] = []
    
    init (list: [String]) {
        self.list = list
    }
     
    func lengthArray()  {
        for _ in list {
            count += 1
        }
    }
        
    var numberOfItems: Int { get {
        lengthArray()
        return count
        }
    }
}
 
let ornek = ornekClass(list: ["a","b"])
print(ornek.numberOfItems) //2
 
 

//-------------------------------------------
//Ornek 2: Inheritance
 
class Fruit {
    var edible: Bool
     
    init(edible: Bool) {
        self.edible = edible
    }
     
    func eat() {
        if edible == true {
            print("You can eat it!")
        } else {
            print("Don't eat it!🤢")
        }
    }
}
 
class Banana: Fruit {
    var color: UIColor!
    
    init(color: UIColor) {
        super.init(edible: true)
        self.color = color
    }
    override func eat() {
        if color == UIColor.yellow {
            print("It's a banana")
        } else {
            print("edible \(edible)")
        }
    }
}

class Apple: Banana {
    
}
 
class DangerousFruit: Fruit {
    init() {
        super.init(edible: false)
    }
}
 
var banana = Banana(color: .yellow)
banana.eat() //It's a banana
 
var apple = Apple(color: .red)
apple.eat() //edible true
 
var dangerousFruit = DangerousFruit()
dangerousFruit.eat() //Don't eat it!🤢
 

 

//-------------------------------------------
//Ornek 3: enum, switch case
 
enum PaymentMethod {
    case Cash
    case Card(_ cardType: String)
}
 
func pay(secim: PaymentMethod) {
    
    switch(secim) {
    case .Cash:
        print("cash payment selected")
    case .Card("debit"):
        print("debit card selected")
    case .Card("credit"):
        print("credit card selected")
    case .Card(_):
        print("enter the type of card")
    default: print("no payment method selected")
    }
}

pay(secim: .Card("")) //enter type of card
 


//-------------------------------------------
//Ornek 4: struct, guard
 
struct S {
    var y: Int!
    var z: Bool?
    var a: String?
     
    mutating func degerAta() {
        let object = S() //y'nin degeri nil
        guard y != object.y else {
            print("y degeri girilmemis / nil")
            y = 3
            return
        }
         
        print("y degeri girilmis")
    }

    mutating func setVariable( _ a: String) {
        self.a = a
        print(a)
    }
     
    func getVariable() -> Any {
        return a as Any
    }
}
 
var object = S(z: false)
print(object) //S(y: nil, z: Optional(false), a: nil)
object.degerAta() //y degeri girilmemis / nil
print(object) //S(y: Optional(3), z: Optional(false), a: nil)
object.degerAta() //y degeri girilmis
object.getVariable() //nil
object.setVariable("a'nin degeri degistirildi") //a'nin degeri degistirildi

