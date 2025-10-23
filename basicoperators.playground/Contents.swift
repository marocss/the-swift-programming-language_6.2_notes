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

//: The % operator calculates and returns remainder as output:  \
//: a = (b _x_ some multiplier) + remainder  \
//: some multiplier is the largest number of multiples of b that will fit inside a.  \
//: 9 = (4 _x_ 2) + 1
-9 % 4
//: -9 = (4 _x_ -2) + -1
//: The sign of b is ignored for negative values of b. a % b and a % -b give the same result.

//: ## Unary Minus Operator
//: Toggle the sign of a numeric value using a prefixed -
let three = 3
let minusThree = -three
let plusThree = -minusThree

//: ## Unary Plus Operator
//: Return the value it operates on without any changes
let minusSix = -6
let alsoMinusSix = +minusSix

//: Can be used to provide symmetry in code when also using unary minus operator.

//: ## Compound Assignment Operators
//: Compound assignment operators combine assignment with another operation. Example with addition assignment operator (+=)
var a2 = 1
a2 += 2

//: > Compound assignment operators don't return a value. let b = a += 2 is invalid.
//:
//: Operators provided by Swift - [Operator Declarations](https://developer.apple.com/documentation/swift/operator-declarations)
//:
//: ## Comparison Operators
//: * Equal to (a == b)
//: * Not equal to (a != b)
//: * Greater than (a > b)
//: * Less than (a < b)
//: * Greater than or equal to (a >= b)
//: * Less than or equal to (a <= b)
//: > Swift provides identity operators (=== and !==). Used to test whether two object references both refer to the same object instance. [Identity Operators](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures#Identity-Operators)
//:
//: Each comparison operator returns a Bool indicative of the statement:
1 == 1
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1

//: Often used in conditional statements. Example if statement:
let name = "world"
if name == "world" {
    print("hello world")
} else {
    print("I am sorry \(name). You are not welcomed here.")
}

//: [Control flow](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow)
//:
//: Two tuples can be compared if they have the same type and number of values. They are compared from left to right, one value at a time, until two values compared aren't equal. If all elements are equal, the tuples are equal.
(1, "zebra") < (2, "apple")     // first elements compared first → 1 < 2 ⇒ true
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog")
//: Since 1 is less than 2, (1, "zebra") is considered less than (2, "apple"), regardless of other  values in the tuples. The comparison is already determined by the tuples' first elements. Only if they are the same the second elements are compared.
(2, "zebra", 3) < (2, "apple", 2)

//: Tuples can only be compared with a given operator if the operator can be applied each value in the tuples. You can compare two tuples type (String, Int) because they can be compared using the < operator. Two tuples of type (String, Bool) can't be compared with < because the < operator can't be applied to Bool values.
("blue", -1) < ("purple", 1)
// ("blue", false) < ("purple", true)
// ./basicoperators.playground:131:17 Binary operator '<' cannot be applied to two '(String, Bool)' operands

//: > The standard library includes comparison for tuples with fewer than seven elements. For seven or more implement the comparison operators.

//: ## Ternary Conditional Operator
//: The _ternary conditional operator_ has three parts. question ? answer1 : answer2. It's a shortcut for evaluating one of the two expressions whether question is true or false. If question is true, answer1 is evaluated and its value returned, else it evaluates answer2 and returns its value.
//: It's a shorthand for:
let question = true
let answer1 = true
let answer2 = false
if question {
    answer1
} else {
    answer2
}

//: Example calculating the height for a table row:
let contentHeight = 40
let hasHeader = true
var rowWeight = contentHeight + (hasHeader ? 50 : 20)

//: That example is a shorthand for:
if hasHeader {
    rowWeight = contentHeight + 40
} else {
    rowWeight = contentHeight + 20
}

//: Use the ternary operator with care. Its conciseness can lead to hard-to-read code if overused. Avoid combining multiple instances into one compound statement.

//: ## Nil-Coalescing Operator
//: It unwraps an optional a if it contains a value, or returns a default value b if a is nil in (a ?? b).  \
//: Expression `a` is always of an optional type. Expression `b` must match the type.
//: Nil-coalescing operator is shorthand for the code below:
let a3: String? = nil
let b3 = "hello"
a3 != nil ? a3! : b3

//: This code above uses the ternary conditional operator and forces unwrapping (a!) to access the value wrapped inside a. Nil-coalescing provides a more elegant way to encapsulate this conditional checking and unwrapping.
//: > If the value of a is non-nil, b isn't evaluated. Known as short-circuit evaluation.
//: Example:
let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName

//: Because userDefinedColorName is of an optional type, nil-coalescing operator (??) can be used to consider its value. Because userDefinedColorName is nil the expression userDefinedColorName ?? defaultColorName returns the value of defaultColorName.  \
//: If it was non-nil the value wrapped inside userDefinedColorName would be used instead.
userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName

//: ## Range Operators
//: Range operators are shortcuts for expressing range of values.

//: ### Closed Range Operator
//: (a...b) Defines a range that runs from a to b, includes the values a and b. a must not be greater than b.  \
//: _Closed range operator_ is useful when iterating over a range in which you want all of the values to be used (as in a for-in loop).
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

//: More about for-in loops: [Control Flow](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow)

//: ### Half-Open Range Operator
//: The _half-open range operator_ (a..<b) defines a range from a to b, not including b. Half open because it contains first value, but not final value. The value of a must not be greater than b. If a equal to b resulting range is empty.  \
//: Useful when working with zero-based lists such as arrays (useful to count up to, but not including, the length of the list).
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

//: The array contains four items, 0..<3 only counts to 3 (the index of the last item in the array) because it's a half-open range. [Arrays](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes#Arrays)

//: ### One-Sided Ranges
//: An alternative form for the closed range operator. Continues as far as possible in one direction. For example, a range that includes all elements of an array from index 2 to the end of the array. In cases like this you can omit the value from one side of the range operator. Is called _one-sided range_ because the operator has value only on one side.
for name in names[2...] {
    print(name)
}

for name in names[...2] {
    print(name)
}

//: The half-open range operator also has a one-sided form written with only its final value. The final value isn't part of the range.
for name in names[..<2] {
    print(name)
}

//: One-sided ranges can be used not just in subscripts. You can't iterate over a one-sided range that omits a first value, it isnt clear where iteration should begin. You _can_ iterate over one that omits its final value, however the range continues indefinitely, an explicit end condition must be added to the loop. You can also check whether a one-sided range contains a value.
let range = ...5
range.contains(7)
range.contains(4)
range.contains(-1)

//: ## Logical Operators
//: _Logical operators_ modify or combine Boolean logic values.
//: * Logical NOT (!a)
//: * Logical AND (a && b)
//: * Logical OR (a || b)

//: ### Logical NOT Operator
//: The _logical NOT operator_ (!a) inverts a Boolean value. true becomes false, false becomes true.
//: It is a prefix operator. Appears immediately before the value it operates. Read as "not a".
let allowEntry = false
if !allowEntry {
    print("ACCESS DENIED")
}

//: "if not allowed entry".  \
//: Careful choice of Boolean constant and variable names can help keep code readable and concise, while avoiding double negatives or confusing logic statements.

//: ### Logical AND Operator
//: The _logical AND operator_ (a && b) creates a logical expression where both values must be true for the overall expression to be true.  \
//: If either is false, the overall expression will be false. If the first value is false, the second value won't be evaluated (short-circuit evaluation).  \
//: Example:
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

//: ### Logical OR Operator
//: (a || b) is an infix operator made from two adjacent pipe characters. Create logical expressions in which only one of the two values has to be true for the overall expression to be true.  \
//: It also uses short-circuit evaluation (left to right).  \
//: Example:
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

//: ### Combining Logical Operators
//: Multiple logical operators can be combined to create longer compound expressions:
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

//: The && and || operators operate on only two values, so this is actually three smaller expressions chained together. It can be read as:  \
//: If we’ve entered the correct door code and passed the retina scan, or we have a valid door key, or know the emergency override password, then allow access.
//: > The Swift logical operators || and && are left-associative. Compound expressions with multiple logical operators evaluate the leftmost subexpression first.

//: ### Explicit Parentheses
//: Parentheses can be used when they're not strictly needed to make intention of complex expressions easier to read. For example:
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

//: Now they make it clear the first two values are part of a separate possible state in the overall logic. The output doesn't change, but the overall intention is clearer to the reader. Readability is preferred over brevity.. Use parentheses where they help to make intentions clear.

//: ---
//: ---

//: _Updated: Oct 21, Session 1 (50min total study)_  \
//: _Updated: Oct 22, Session 2 (100min total study)_  \
//: _Updated: Oct 23, Session 3 (200min total study)_  \
//: _Updated: Oct 23, Session 4 (250min total study)_

// | Date   | Session | Duration | Cumulative | Focus Area                                           |
// | ------ | ------- | -------- | ---------- |------------------------------------------------------|
// | Oct 21 | 1       | 50min    | 50min      | Basic Operators – Introduction & Assignment          |
// | Oct 22 | 2       | 50min    | 100min     | Arithmetic & Remainder Operators                     |
// | Oct 23 | 3       | 100min   | 200min     | Unary, Compound, Comparison, Ternary, Nil-Coalescing |
// | Oct 23 | 4       | 50min    | 250min     | Range & Logical Operators (Completed Chapter)        |
