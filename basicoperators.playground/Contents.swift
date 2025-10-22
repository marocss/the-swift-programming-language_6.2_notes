import Cocoa

var greeting = "Hello, playground"

//: # Basic Operators
//: assignment, arithmetic, and comparison.
//:
//: Operator: special symbol or phrase to check, change or combine values.  \
//: Examples:
//: * \+
//: * AND
//: * &&
//:
//: The assignment operator (=) doesn't return a value to prevent being mistakenly used when  equal to operator is intended (==). Arithmetic operators detect and disallow value overflow, to avoid unexpected results when working with numbers that become larger or smaller than the allowed value range of the type that stores them. Opt in to overflow behavior by using Swift’s overflow operators [Overflow Operators](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/advancedoperators/#Overflow-Operators)  \
//: Swift provides range operators (not found in C), such as a..<b and a...b as shortcut for expressing a range of values.  \
//: This chapter covers common operators. [Advanced Operators](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/advancedoperators/) covers advanced operators and how to define custom operators and implement standard operators for custom types.
//:
//: ## Terminology
//: Operators are unary, binary, ternary:
//: * _Unary_: operate on single target (-a). Unary _prefix_ operators appear immediately before their target (!b). Unary _postfix_ appear immediately after their tareget (c!).
//: * _Binary_: operate on two targets (a + b). Are infix (appear in between their two targets).
//: * _Ternary_: operate on three targets. Only one ternary operator (like C), the ternary conditional operator (a ? b : c).
//:
//: Values that operators affect are _operands_. in 1 + 2, the + symbol is an infix operator and its two operands are 1 and 2.
//:
//: ## Assignment Operator
//: The assignment operator (=) initializes or updates aa variable or constant's value.
let b = 10
var a = 5
a = b

//: If the right side is a tuple with multiple values, its elements can be decomposed into multiple constants or variables at once
let (x, y) = (1, 2)
(x, y)

//: The assignment operator doesn't itself return a value. The following statement isn't valid
//if x = y {
//    
//}
// ./basicoperators.playground:37:4 Cannot assign to value: 'x' is a 'let' constant
// ./basicoperators.playground:37:6 Use of '=' in a boolean context, did you mean '=='?

//: ## Arithmetic Operators
//: * Addition +
//: * Subtraction -
//: * Multiplication *
//: * Division /
1 + 2
5 - 3
2 * 3
10.0 / 2.5

//: Arithmetic operators don't allow overflow by default. (Opt in using overflow operators (a &+ b). [Overflow Operators](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/advancedoperators/#Overflow-Operators)
//: Addition operator is also supported for String concatenation
"Hello" + " World"

//: ## Remainder Operator
//: The _remainder operator_ (a % b) works out how many multiples of b will fit inside a and returns the value that's left over (remainder).
//: > The remainder operator (%) is also known as _modulo operator_ in other languages. Its behavior in Swift for negative numbers means that, strictly speaking, it is a remainder rather than a modulo operation.
//:
//: Example to calculate 9 % 4:  \
//: ![remainder-integer](remainderInteger@2x.png)
9 % 4
