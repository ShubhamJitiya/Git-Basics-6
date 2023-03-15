//: [Previous](@previous)

import Foundation

enum PasswordError: Error {
    case emptyPassword
    case passwordTooShort
}

func validatePassword(_ password: String) throws {
    guard !password.isEmpty else {
        throw PasswordError.emptyPassword
    }
    
    guard password.count >= 8 else {
        throw PasswordError.passwordTooShort
    }
    
    print("Password is valid!")
}

do {
    try validatePassword("") // Throws emptyPassword exception
} catch PasswordError.emptyPassword {
    print("Password cannot be empty.")
} catch PasswordError.passwordTooShort {
    print("Password must be at least 8 characters.")
    }

//2.
enum ShoppingError: Error {
    case notEnoughQuantity
}

struct Item {
    let name: String
    var quantity: Int
}

class ShoppingCart {
    var items: [Item] = []
    
    func addItem(_ item: Item) {
        items.append(item)
    }
    
    func removeItem(_ item: Item) {
        if let index = items.firstIndex(where: { $0.name == item.name }) {
            items.remove(at: index)
        }
    }
    
    func updateQuantity(for item: Item, to newQuantity: Int) throws {
        guard newQuantity <= item.quantity else {
            throw ShoppingError.notEnoughQuantity
        }
        if let index = items.firstIndex(where: { $0.name == item.name }) {
            items[index].quantity = newQuantity
        }
    }
}

// Example usage:
let cart = ShoppingCart()

let item1 = Item(name: "Shirt", quantity: 5)
let item2 = Item(name: "Pants", quantity: 2)
cart.addItem(item1)
cart.addItem(item2)

do {
    try cart.updateQuantity(for: item1, to: 10) // Throws an exception since there are only 5 shirts available
} catch ShoppingError.notEnoughQuantity {
    print("Not enough quantity available")
}

print(cart.items) // Prints [Item(name: "Shirt", quantity: 5), Item(name: "Pants", quantity: 2)]
