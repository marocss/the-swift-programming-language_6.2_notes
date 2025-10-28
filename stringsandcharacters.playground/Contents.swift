import Cocoa

//: # Strings and Characters
//: Store and manipulate text.

//: A string is a series of characters. In Swift they are represented by the String type. Contents of a String can be accessed in various ways, including as a collection of Character values.  \
//: String and Character types provide fast, Unicode-compliant way to work with text in code. Syntax for creation and manipulation is lightweight and readable. String concatenation is just combining two strings with the + operator. Mutability is managed by choosing between a constant and variable. Swift supports string interpolation (insert constants, variables, literals, and expressions into longer strings).  \
//: Every string is composed of encoding-independent Unicode characters. It has support for accessing those characters in various Unicode representations.  \

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
//: ./stringsandcharacters.playground:97:16 Left side of mutating operator isn't mutable: 'constantString' is a 'let' constant

//: > Different approach from Objective-C and Cocoa, where you choose between two classes (NSString and NSMutableString) to indicate whether a string can be mutated.

//: ## Strings Are Value Types
//: The String type is a _value type_ in Swift. When creating a new value, that String value is copied when it's passed to a function or method, or when assigned to a constant or variable. A new copy of the String value is created, and the copy is passed or assigned, not the original. Value types described in [Structures and Enumerations Are Value Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures#Structures-and-Enumerations-Are-Value-Types)
