//optionals

var score:Int?
print("Score is \(score)")
score=80
if score != nil {
    print("The score is \(score!)")
}

if let currentScore = score {
    print("My current score is \(currentScore)")
}

let newScore :Int! = 95
print("My new score is \(newScore)")


//functions

func sayHello () {
    print("Hello class")
}

sayHello()

func sayHello (first: String, last: String){
    print("Hi \(first) \(last)")
}

sayHello("Bill", last: "Adams")

func sayWhat (firstName first: String, lastName last: String){
    print("What \(first) \(last)?")
}

sayWhat(firstName: "Bill", lastName: "Adams")

func sayWhy (firstName first: String, lastName last: String)->String{
    return "Why " + first + " " + last + "?"
}

let msg = sayWhy(firstName: "Jane", lastName: "Adams")
print(msg)


//closures

let names=["Tom", "Jessie", "Megan", "Angie"]

func backwards(s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversed = names.sort(backwards)

//closure
reversed = names.sort({(s1:String, s2: String)->Bool in return s1 > s2})
print(reversed)

//type inference
reversed = names.sort( { s1, s2 in return s1 > s2 } )
print(reversed)

//shorthand
reversed = names.sort( { s1, s2 in s1 > s2 } )
print(reversed)

reversed = names.sort( { $0 > $1 } )
print(reversed)

//enums
enum carType {
    case gas
    case electric
    case hybrid
}

var car = carType.electric
car = .hybrid


//type casting
class Pet {
    var name: String
    init(name: String){
        self.name = name
    }
}

class Dog : Pet {
    var breed: String
    init(name: String, breed: String) {
        self.breed=breed
        super.init(name: name)
    }
}

class Fish : Pet {
    var species: String
    init(name: String, species: String) {
        self.species=species
        super.init(name: name)
    }
}

let myPets=[Dog(name: "Cole", breed: "Black Lab"), Dog(name: "Nikki", breed: "German Shepherd"), Fish(name: "Nemo", species: "Clown Fish")]

var dogCount = 0
var fishCount = 0

for pet in myPets {
    if pet is Dog {
        ++dogCount
    }
    else if pet is Fish {
        ++fishCount
    }
}

print("I have \(dogCount) dogs and \(fishCount) fish")

for pet in myPets {
    if let dog = pet as? Dog {
        print("\(dog.name) is a \(dog.breed)")
    } else if let fish = pet as? Fish {
        print("\(fish.name) is a \(fish.species)")
    }
}


