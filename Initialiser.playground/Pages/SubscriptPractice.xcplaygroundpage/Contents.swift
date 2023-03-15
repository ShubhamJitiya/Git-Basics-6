import Foundation

var greeting = "Hello, playground"

var arr = Array(1...5)
arr[0]

//1. gets length
class Length {
    subscript(str: String) -> Int {
        get {
            return str.count
        }
        set {
            //We will use this later
        }
    }
}

var name = Length()
name["shubham"]

//2. Reveres string
class Reverse {
    subscript(name: String) -> String {
        return String(name.reversed())
    }
}

var reverseString = Reverse()
reverseString["Shubham"]

//3. Even odd
class EvenOdd {
    subscript(num: Int) -> String {
        if num % 2 == 0 {
            return "Even"
        } else {
            return "Odd"
        }
    }
}

var checkNum =  EvenOdd()
checkNum[3]

//4. Area
struct Area {
    subscript(length: Double, widhth: Double) -> Double {
        return length * widhth
    }
}

var area = Area()
area[4.5, 2.0]

//5. Overloading
struct Overloading {
    subscript(name: String) -> String {
        return String(name.reversed())
    }
    
    subscript(str: String) -> Int {
        return str.count
    }
    
}


var overloading = Overloading()
var count: Int = overloading["Shubham"]
var reverse: String = overloading["Shubham"]


//6. subscripts with stored property
class Name {
    let LABEL = "Your name: "
    subscript(name: String) -> String {
        return LABEL + name
    }
}

var nameOne = Name()
nameOne["Jitiya Shubham"]


//7. Setters with subscripts
struct MupltiplesOfTwo {
    var values: [Int] = []
    
    subscript(index: Int) -> Int {
        get {
            values[index]
        }
        set(num) {
            values[index] = num * 2
        }
    }
}
var nums = MupltiplesOfTwo()
nums.values = [1, 2, 3, 4, 5]
print(nums.values)

print(nums[2])

nums[2] = 6
print(nums[2])
print(nums.values)

//Can we use subscripts are an initialiser?
