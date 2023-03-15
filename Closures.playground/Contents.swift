import UIKit

//eg. in buttons
//Difference between closure and functions

/*
                        Closures       Fn
 Name                       x          Y
 Argument labels            x          Y
 Default parameters         x          Y
 Write inline               Y          x
 
 */


 //2. Invalid: Arguments in closures

//Function
func add(a: Int, b: Int) -> Int {
    return a + b
}

//Demonstrate
var operate = add
add(a: 5, b: 5) //Function
operate(5, 5) //Closure - Valid
//operate(a: 5, b: 5) //Closure - Valid

//---------------------------------------------------------

typealias Operate = (Int, Int) -> Int

//Operate & return is optional
var addClosure: Operate = {
    (a: Int, b: Int) -> Int in
    return a + b
}

addClosure(5, 5)

//3. Invalid: Default parameters
//var addClosure2: Operate = {
//    (a: Int, b: Int = 10) -> Int in
//    return a + b
//}

addClosure(5, 5)

//---------------------------------------------------------

//Shorthand
var testClosure: (String, String) -> String
testClosure = { $1 } //no. of parameter to access

print(testClosure("One", "Two"))

//Why to use closure instead of functions?



//---------------------------------------------------------
//Exercise

//Function
func fullName(firstName: String, lastName: String?) -> String {
        firstName + " " + (lastName ?? "")
}

//Closure
var fullName2: (String, String?) -> String = {
    (firstName, lastName: String?) -> String in
    return firstName + " " + (lastName ?? "")
}
fullName2("Shubham", "Jitiya")

var fullName2 = {
    (firstName, lastName: String?) -> String in
    return firstName + " " + (lastName ?? "")
}
fullName2("Shubham", "Jitiya")

var fullName2 = {
    (firstName, lastName: String?) -> String in
     firstName + " " + (lastName ?? "")
}
fullName2("Shubham", "Jitiya")
