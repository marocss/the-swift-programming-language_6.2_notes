import Cocoa

//: # Strings and Characters
//: Store and manipulate text.

//: A string is a series of characters. In Swift they are represented by the String type. Contents of a String can be accessed in various ways, including as a collection of Character values.  \
//: String and Character types provide fast, Unicode-compliant way to work with text in code. Syntax for creation and manipulation is lightweight and readable. String concatenation is just combining two strings with the + operator. Mutability is managed by choosing between a constant and variable. Swift supports string interpolation (insert constants, variables, literals, and expressions into longer strings).  \
//: Every string is composed of encoding-independent Unicode characters. It has support for accessing those characters in various Unicode representations.

//: > Swift's String type is bridged with Foundation's NSString class. Foundation also extends String to expose methods defined by NSString. If Foundation is imported the NSString methods can be accessed on String without casting. For more information: [Bridging Between String and NSString](https://developer.apple.com/documentation/swift/string#2919514)

//: ## String Literals
//: A sequence of characters surrounded by double quotation marks
let someString = "Some string literal value"

//: Swift infers a type of String for the constant because it's initialized with a string literal value.

//: ### Multiline String Literals
//: A sequence of characters surrounded by three double quotation marks. Spans several lines.
let quotation = """
The white Rabbit put on his spectacles. "Bla bla"

"Bla bla bla", bla bla bla.
"""

//: A multiline string literal includes all of the lines between its quotation marks. The string begins on the first line after the opening quotation marks and ends on the line before the closing quotation marks. Neither of the strings below start or end with a line break:
let singleLineString = "These are the same? Maybe"
let multilineString = """
These are the same? Maybe
"""

//: Line breaks inside the string appear in the string's value. To use line breaks to make code easier to read but without using the line breaks as a part of the string's value, write a backslash (\) at the end of those lines.
let softWrappedQuotation = """
The Rabbit again. "Bla bla bla, \
bla bla" he blabbed.

"Bla bla" go on \
bla bla bla.
"""

//: To make a multiline string literal that begins or ends with a line feed, write a blank line as the first or last line.
let lineBreaks = """

This string starts with a line break.
And ends with one.

"""

//: A multiline string can be indented to match surrounding code. The whitespace before the closing quotation marks tells Swift what whitespace to ignore before all the other lines. If you write whitespace at the beginning of a line in addition to what is before the closing quotation marks, that whitespace is included.
//: ![whitespace](multilineStringWhitespace@2x.png)

//: ### Special Characters in String Literals
//: String literals can include the following special characters:
//: * Escaped special characters
//:     * \0 (null character)
//:     * \\\ (backslash)
//:     * \t (horizontal tab)
//:     * \n (line feed)
//:     * \r (carriage return)
//:     * \\" (double quotation mark)
//:     * \\' (single quotation mark)
//: * Arbitrary Unicode scalar value, as \u{n}, where n is a 1-8 digit hexadecimal number.
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

//: To include """ as text inside a multiline string literal, escape at least one of the quotation marks.
let threeDoubleQuotes = """
Escaping the first one \"""
Escaping all \"\"\"
"""

//: ### Extended String Delimiters
//: Place a string literal within _extended delimiters_ (number signs) to include special characters in a string without invoking their effect. Place string within quotation marks and surround that with number signs (#).
//: If you need the special effects of a character in a string literal, match the number of number signs within the string following the escape character (\). For example #"Line1\nLine 2"#, to break the line use #"Line 1\#nLine 2"# instead. Or ###"Line 1\###nLine 2"###
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes" """
"""#

//: ## Initializing an Empty String
//: Either assign an empty string literal to a variable or initialize a new String instance with initializer syntax.
var emptyString = ""
var anotherEmptyString = String()

//: Find whether a String value is empty by checking its Boolean isEmpty property.
if emptyString.isEmpty {
    print("Nothing here.")
}

//: ## String Mutability
//: Indicate string mutability by assigning it to a variable or to a constant.
var mutableString = "Hello, world!"
mutableString += " Swift!"

let constantString = "Hello, world! Again."
//constantString += " Swift!"
///./stringsandcharacters.playground:97:16 Left side of mutating operator isn't mutable: 'constantString' is a 'let' constant

//: > Different approach from Objective-C and Cocoa, where you choose between two classes (NSString and NSMutableString) to indicate whether a string can be mutated.

//: ## Strings Are Value Types
//: The String type is a _value type_ in Swift. When creating a new value, that String value is copied when it's passed to a function or method, or when assigned to a constant or variable. A new copy of the String value is created, and the copy is passed or assigned, not the original. Value types are described in [Structures and Enumerations Are Value Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures#Structures-and-Enumerations-Are-Value-Types).  \
//: Swift's copy-by-default behavior ensures that when a function or method passes you a String value, it's clear that you own that exact String value, regardless of where it came from. The string you are passed won't be modified unless you modify it yourself.  \
//: The compiler optimizes string usage so that actual copying takes place only when necessary, ensuring great performance.

//: ## Working with Characters
//: Access individual Character values for a String by iterating over it with a for-in loop.
for character in "Dog!🐱" {
    print(character)
}

//: [For-In Loops](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow#For-In-Loops).  \
//: Create a stand-alone Character constant or variable from a single-character string literal by providing a Character type annotation
let exclamationMark: Character = "?"

//: String values can be constructed by passing an array of Character values as an argument to its initializer
let catCharacters: [Character] = ["C", "a", "t", "!", "🐶"]
let catString = String(catCharacters)
print(catString)

//: ## Concatenating Strings and Characters
//: Use the addition operator
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

//: Append a String value to a String variable using addition assignment operator (+=)
var instruction = "look over"
instruction += string2

//: Append a Character value to a String variable with the String type's append() method
welcome.append(exclamationMark)

//: > Can't append a String or Character to a Character variable, because a Character value must contain a single character only.  \
//: To build up the lines of a longer string using multiline string literals every line, including the last line, needs to end with a line break.
let badStart = """
    one
    two
    """

let end = """
    three
    """
print(badStart + end)

let goodStart = """
    one
        two

    """
print(goodStart + end)

//: ## String Interpolation
//: _String interpolation_ is a way to construct a new String value from a mix of constants, variables, literals, and expressions by including their value inside a string literal. String interpolation can be used on single-line and multiline string literals. Each item inserted is wrapped in a pair of parentheses, prefixed by a backslash (\)
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
///if no Double(): ./stringsandcharacters.playground:157:46 Cannot convert value of type 'Int' to expected argument type 'Double'

//: The placeholder is replaced with the actual value of multiplier when the string interpolation is evaluated to create an actual string.  \
//: The expression calculates the value and inserts the result into the string.  \
//: Extended string delimiters can be used to create strings containing characters that would otherwise be treated as a string interpolation.
print(#"Write an interpolated string in Swift using \(multiplier)"#)

//: To use string interpolation inside a string with extended delimiters, match the number of number signs after the backslash to the number of number signs at the beginning and end of the string.
print(#"6 times 7 is \#(6 * 7)"#)

//: > The expressions inside the parentheses within an interpolated string can't contain an unescaped backslash (\), a carriage return, or a line feed. They can contain other string literals.

//: ## Unicode
//: Unicode is an international standard for encoding, representing, and processing text in different writing systems. It enables representation of almost any character from any language in a standardized form, and to read and write those characters to and from an external source (text file or web page). String and Character types are fully Unicode-compliant.

//: ### Unicode Scalar Values
//: Swift's native String type is built from _Unicode scalar values_. A unique 21-bit number for a character or modifier (U+0061 for LATIN SMALL LETTER A).  \
//: Not all Unicode scalar values are assigned to a character. Some are reserved for future assignment or for use in UTF-16 encoding. Scalar values that have been assigned to a character typically also have a name (LATIN SMALL LETTER A).

//: ### Extended Grapheme Clusters
//: Every instance of Swift's Character type represents a single _extended grapheme cluster_. A sequence of one or more Unicode scalars that (when combined) produce a single human-readable character.  \
//: Example: The letter "é" can be represented as a single Unicode scalar (LATIN SMALL LETTER E WITH ACUTE, U+00E9). It can also be represented as a pair of scalars, a letter e (LATIN SMALL LETTER E, U+0065), followed by the COMBINING ACUTE ACCENT (U+0301). The COMBINING ACUTE ACCENT scalar is graphically applied to the scalar that precedes it, turning "e" into an "é" when rendered by a Unicode-aware text-rendering system.  \
//: In both cases, "é" is represented as a single Swift Character value that represents an extended grapheme cluster. In the first case, it contains a single scalar, in the second case it's a cluster of two scalars.
let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"

//: Extended grapheme clusters are a flexible way to represent many complex script characters as a single Character value. Hangul syllables (Korean alphabet), for example, can be represented as either a precomposed or decomposed sequence. Both qualify as a single Character value in Swift.
let precomposed: Character = "\u{D55C}"     //: 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"      //: ᄒ, ᅡ, ᆫ

//: Extended grapheme clusters enable scalars for enclosing marks (COMBINING ENCLOSING CIRCLE, U+20DD) to enclose other Unicode scalars as a single Character value.
let enclosedEAcute: Character = "\u{E9}\u{20dd}"
///the order matters

//: Unicode scalars for regional indicator symbols can be combined in pairs to make a single Character value. REGIONAL INDICATOR SYMBOL LETTER U (U+1F1FA) and REGIONAL INDICATOR SYMBOL S (U+1F1F8)
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
let regionalIndicatorForBR: Character = "\u{1F1E7}\u{1F1F7}"

//: ## Counting Characters
//: Use the count property of the string to retrieve a count of Character values.
let unusualMenagerie = "Koala 🐨, Platypus 🦜, Pufferfish 🐠"
print("unusualMenagerie has \(unusualMenagerie.count) characters")

//: Swift's use of extended grapheme clusters for Character values means that string concatenation and modification may not always affect a string's character count.  \
//: If you initialize a new string with the word "cafe" and append a COMBINING ACUTE ACCENT (U+0301) to the end, the resulting string will still have 4 characters, with a fourth character of "é".
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")

word += "\u{301}"
print("the number of characters in \(word) is \(word.count)")

//: > Extended grapheme clusters can be composed of multiple Unicode scalars. Different characters, and different representations of the same character, can require different amounts of memory. Characters in Swift don't each take up the same amount of memory within a string's representation. As a result, the number of characters in a string can't be calculated without iterating through the string to determine its extended grapheme cluster boundaries. In particularly long string values, be aware that the `count` property must iterate over the Unicode scalars in the entire string to determine the characters for that string.
//: > The character count isn’t always the same as the length property of an NSString with the same characters. The length of an NSString is based on the number of 16-bit code units within the string's UTF-16 representation and not the number of Unicode extended grapheme clusters.

//: ## Accessing and Modifying a String
//: Use methods, properties, or subscript syntax to access and modify a string.

//: ### String Indices
//: String values have an associated index type (String.Index) that corresponds to the position of each Character.  \
//: Because different characters can require different amounts of memory each Unicode scalar must be iterated over to determine a Character particular position. For this reason, Swift strings can't be indexed by integer values.  \
//: The startIndex property is used to access the position of the first Character of a String. The endIndex property is the position after the last character. Therefore, endIndex is an invalid argument to a string's subscript. These values are equal when a String is empty.  \
//: The String methods index(before:) and index(after:) are used to access the indices before and after a given index.  \
//: Subscript syntax can be used to access the Character at a String index.
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]

let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
///index outise string's range or Character at an index outside of a string's range trigger a runtime error. Swift/StringCharacterView.swift:158: Fatal error: String index is out of bounds
//greeting[greeting.endIndex]
//greeting.index(after: greeting.endIndex)

//: The indices property can be used to access all indices of individual characters in a string.
for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}

//: > The properties startIndex and endIndex and the methods index(before:), index(after:), and index(_:offsetBy:) can be used on any type that conforms to the Collection protocol (String, Array, Dictionary, and Set).

//: ### Inserting and Removing

