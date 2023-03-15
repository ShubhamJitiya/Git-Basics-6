import Foundation

//Similar to accesing elements in array
class DaysOfWeek {

    private var days = ["Sunday", "Monday", "Tuesday"]

    subscript(index: Int) -> String {
        get {
            return days[index]
        }

        set(newValue) {
            self.days[index] = newValue
        }

    }
}

var p = DaysOfWeek()
print(p[0])




//1. Subscripts - Read only ----------------------|

struct Stadium {
    let numberOfLegsPerPerson = 2
    
    subscript(numberOfPeople: Int) -> Int {
        numberOfLegsPerPerson * numberOfPeople
    }
}

let stadium = Stadium()
stadium[5]


//gets length
struct SomeStruct {
    subscript(someInput: String) -> Int {
        get {
            return someInput.count
        }
        
        set(someNewValue) {
            //
        }
    }
}

var someStruct = SomeStruct()
someStruct["new"]

//Reverse string
struct ReverseString {
    subscript(string: String) -> String {
        return String(string.reversed())
    }
}

var str = ReverseString()
str["Shubham"]

//Even odd
class EvenOdd {
    subscript(num: Int) -> String {
        if num % 2 == 0 {
            return "Even"
        } else {
            return "Odd"
        }
    }
}

var checkNum = EvenOdd()
checkNum[2]

//2. Subscripts - Read only - Multiple parameters --------|
struct Area {
    subscript(length: Double, width: Double) -> Double {
        return length * width
    }
}

var area = Area()
area[4.5, 2]


//3. Subscripts - Read only - Multiple parameters --------|
//Is it possible to create two subscripts of same input parameter but different return type?
//Yes, but we must specify which subscript we want to call. while calling we should assign it to a var of type annotation. By this we are sure to which subscript we are expecting from its return type. or Else we get ambiguity error

//check num ? even odd : count
struct Overloading {
    subscript(num: Int) -> String {
        if num % 2 == 0 {
            return "Even"
        } else {
            return "Odd"
        }
    }
    
    subscript(string: String) -> String {
        return String(string.reversed())
    }
//    //Error - same input parameter - Ambigous use of subscript
    subscript(string: String) -> Int {
        return string.count
    }
    
    subscript(str1: String, str2: String) -> Int {
        return str1.count + str2.count
    }
}

let overloading = Overloading()
overloading[3]

//overloading["Shubham"] //ambigous call
var reverse: String = overloading["Shubham"] //Resolving ambiguity
var count: Int = overloading["Shubham"]

//4. subscripts with setters : write
//Can I write get without set? Yes,
class Name {
    let LABEL = "Your name: "
    
    subscript(name: String) -> String {
//        get {
//            return LABEL + name
//        }
        return LABEL + name
    }
}

let name = Name()
name["Shubham Jitiya"]

//5. subscripts with getters & setters

//class Student {
//    var firstName, lastName: Stringse
//    var college: String
//
//    subscript(fName: String, lName: String, clg: String) -> String {
//        get {
//            return "Registered successfully!"
//        }
//        set(firstName) {
//            self.firstName = fName
//            self.lastName = fName
//            self.college = clg
//        }
//    }
//}

//How to use setters
struct MyStruct {
    var values = [Int]()
    
    subscript(index: Int) -> Int {
        get {
            return values[index]
        }
        set(newValue) {
            values[index] = newValue * 2
        }
    }
}

var myStruct = MyStruct()
myStruct.values = [1, 2, 3, 4, 5]
print(myStruct[2]) // Output: 3

myStruct[2] = 6 //Pause the video and think the op??
print(myStruct[2]) // Output: 3
print(myStruct.values) // Output: [1, 2, 12, 4, 5]

//
class Student {
    var firstName: String?
    var lastName: String?
    var college: String?
    
    subscript(firstName: String, lastName: String, college: String) -> String? {
        get {
            if self.college == college {
                return self.college
            } else {
                return nil
            }
        }
        set(newValues) {
            if let newValues = newValues {
                let components = newValues.split(separator: " ")
                if components.count == 3 {
                    self.firstName = String(components[0])
                    self.lastName = String(components[1])
                    self.college = String(components[2])
                }
            }
        }
    }
}

var studentOne = Student()
studentOne["Jitiya", "Shubham", "Gec-GN"]
studentOne.firstName


//subscripts with variadic - any number of parameters
struct SomeStruct2 {
    var values: [String: Int] = [:] //default values
    
    subscript(keys: String...) -> Int? {
        var sum = 0
        for key in keys {
            guard let value = values[key] else {
                return nil
            }
            sum += value
        }
        return sum
    }
    
    //For class
//   init(values: [String: Int]) {
//       self.values = values
//   }
}

//let myStruct = SomeStruct2(values: ["a": 1, "b": 2, "c": 3]) //default memberwise initialiser
//
//let result = myStruct2["a", "b"]
//print(result!) // Output: 3

//struct - Can we use subscript as a initialiser?
//Demonstrate me the use of setters in subscript in swift?
struct Gradebook {
    private var grades: [String: Int] = [:]
    
    subscript(studentName: String) -> Int? {
        get {
            return grades[studentName]
        }
        set(newValue) {
            if let newValue = newValue {
                grades[studentName] = newValue
            } else {
                grades.removeValue(forKey: studentName)
            }
        }
    }
}

var gradebook = Gradebook()

// Setting a grade using subscript with a setter
gradebook["Alice"] = 90

// Getting a grade using subscript with a getter
if let aliceGrade = gradebook["Alice"] {
    print("Alice's grade is \(aliceGrade)")
}

// Removing a grade using subscript with a setter
gradebook["Alice"] = nil

// Checking that the grade was removed using subscript with a getter
if let aliceGrade = gradebook["Alice"] {
    print("Alice's grade is \(aliceGrade)")
} else {
    print("Alice does not have a grade in the gradebook.")
}

//use setters in class to set multiple stored property in swift subscripts
//


class Student2 {
    var firstName: String
    var lastName: String
    var grade: Int
    
    init(firstName: String, lastName: String, grade: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.grade = grade
    }
}

class Classroom {
    var students: [String: Student] = [:]
    
    subscript(studentName: String) -> Student? {
        get {
            return students[studentName]
        }
        set(newValue) {
            if let newValue = newValue {
                students[studentName] = newValue
            } else {
                students.removeValue(forKey: studentName)
            }
        }
    }
}

var classroom = Classroom()

//// Setting a new student using subscript with a setter
//classroom["Alice"] = Student(firstName: "Alice", lastName: "Smith", grade: 90)
//
//// Getting a student using subscript with a getter
//if let alice = classroom["Alice"] {
//    print("First name: \(alice.firstName), last name: \(alice.lastName), grade: \(alice.grade)")
//}
//
//// Setting multiple properties using subscript with a setter
//classroom["Bob"]?.firstName = "Bob"
//classroom["Bob"]?.lastName = "Jones"
//classroom["Bob"]?.grade = 85
//
//// Getting a student with updated properties using subscript with a getter
//if let bob = classroom["Bob"] {
//    print("First name: \(bob.firstName), last name: \(bob.lastName), grade: \(bob.grade)")
//}

struct MyArray {
    private var values: [Int] = []
    
    subscript(index: Int) -> Int {
        get {
            return values[index]
        }
        set(newValue) {
            values[index] = newValue
        }
    }
}

var array = MyArray()
array[0] = 1
array[1] = 2
array[2] = 3
print(array[1]) // Output: 2



