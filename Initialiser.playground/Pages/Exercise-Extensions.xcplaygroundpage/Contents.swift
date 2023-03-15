import Foundation

//1.
extension String {
    mutating func insert(_ character: Character, at index: Int) {
        guard index >= 0 && index <= count else { return }
        let insertionIndex = self.index(startIndex, offsetBy: index)
        insert(character, at: insertionIndex)
    }
}

var str = "Hello World"
str.insert("-", at: 5)
print(str) // Output: "Hello- World"

//2.
extension String {
    mutating func replace(_ oldCharacter: Character, with newCharacter: Character) {
        guard let index = firstIndex(of: oldCharacter) else { return }
        replaceSubrange(index...index, with: String(newCharacter))
    }
}

var str = "Hello World"
str.replace("o", with: "0")
print(str) // Output: "Hell0 W0rld"

//3.
extension String {
    mutating func removeSpaces() {
        self = self.filter { !$0.isWhitespace }
    }
}

var str = "    Hello    World    "
str.removeSpaces()
print(str) // Output: "HelloWorld"

//4.
extension String {
    var wordCount: Int {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        let words = components.filter { !$0.isEmpty }
        return words.count
    }
}

var str = "The quick brown fox jumps over the lazy dog"
let count = str.wordCount
print(count) // Output: 9

