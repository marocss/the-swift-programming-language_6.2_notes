import Cocoa

//: # Collection Types
//: Organize data using arrays, sets, and dictionaries.

//: Swift provides three primary _collection types_ for storing collections of values: arrays, sets, and dictionaries. Arrays are ordered. Sets are unordered. Dictionaries are unordered collections of key-value associations.
//: ![collection-types](CollectionTypes_intro@2x.png)

//: You can't insert a value of the wrong type into a collection by mistake. Swift is explicit about the types of values and keys collections can store.
//: > Swift's array, set, and dictionary types are implemented as _generic collections_. For more about generic types: [Generics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics).

//: ## Mutability of Collections
//: If you assign an array, set, or dictionary to a variable, the collection created will be _mutable_. You can change (mutate) the collection by adding, removing, or changing items. If you assign to a constant, that collection is _immutable_, its size and contents can't be changed.
