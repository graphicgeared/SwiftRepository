import UIKit

let aNumber = 3
let aString = "Hello"
let aBool = true

let anArray = [1,2,3]
let aDictionary = ["key1": "value1", "key2": "value2"]


class Person: ExpressibleByStringLiteral {
    let name: String
    init(name value: String) {
        self.name = value
    }

    required convenience init(stringLiteral value: String) {
        self.init(name: value)
    }

    required convenience init(extendedGraphemeClusterLiteral value: String) {
        self.init(name: value)
    }

    required convenience init(unicodeScalarLiteral value: String) {
        self.init(name: value)
    }
}

let p: Person = "xiaoMing"
print(p.name)
