import UIKit


class Student {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age  = age
    }
}
//
//class CollegeStudent: Student {
//    var college: String
//
//
//   required init(college: String){
//        self.college = college //phase 1
//        super.init(name: name, age: age) //2
//    }
//    init(college: String, name: String, age: Int){
//        self.college = college //phase 1
//        super.init(name: name, age: age) //2
//    }
//
//}
//
//var studentOne = CollegeStudent(college: "XYZ", name: "Shubham Jitiya", age: 5)
//studentOne.name
//studentOne.college
//studentOne.age


//I can't change value of property, if instance is assigned to let regarless of its properties are let or var. let is obviously can't be reassigned.
struct TestOne {
    let constant = "Constant"
    var variable = "variable"
}

let testOne = TestOne()
//testOne.variable = "ABC" //can't change becuase instance is asssigned to constant

//we can update variables of class instance (not constants) assigned to constant
class TestTwo {
    let constant = "Constant"
    var variable = "variable"
}

let testTwo = TestTwo()
//testTwo.constant = "ABC" //can;t change because property is constant
testTwo.variable = "ABC"


