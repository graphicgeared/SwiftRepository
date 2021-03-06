var a: (String, Int) = ("Age", 6)
let fullName: (String, String) = ("Bill", "Jackson")
println(a)
println(fullName)

var loco = ("Flying Scotsman", 4472, "4-6-2")
println(loco)
let name = loco.0 // assigns "Flying Scotsman" 
let number = loco.1 
println(name)
println(number)

// naming tuple components
var person: (name: String, age: Int) 
person.name = "Fred"
person.age = 21
let c = person.age
let result = (errCode: 56, errMessage:"file not found") 
var s = result.errMessage

typealias locoDetail = (name:String, number: Int, configuration: String)
var thomas: locoDetail = ("thomas",1,"0-1-2")
println("\n \(thomas) #typealias#")

// return a tuple
func getAHighScore() -> (name: String, score: Int)
{
    let theName = "Abel"
    let theScore = 150

    return (theName,theScore)
}
println("getAHighScore()=\(getAHighScore())")


