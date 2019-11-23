import CoreGraphics

//: ## Basic math protocols
//: Any type conforming to `Divisable` for example, must implement `/` operator, etc...

public protocol Multipliable {
  static func *(lhs: Self, rhs: Self) -> Self
}

public protocol Divisable {
  static func /(lhs: Self, rhs: Self) -> Self
}

// Not to be confused with edible
public protocol Addable {
  static func +(lhs: Self, rhs: Self) -> Self
}

public protocol Subtractable {
  static func -(lhs: Self, rhs: Self) -> Self
}

public protocol Negetable {
  static prefix func -(lhs: Self) -> Self
}

//: `Arithmeticable`™️
public typealias Arithmeticable = Addable & Subtractable & Multipliable & Divisable
public typealias SignedArithmeticable = Arithmeticable & Negetable

// MARK: - Conform builtin types to basic math protocols

extension Int: SignedArithmeticable {}
extension Int8: SignedArithmeticable {}
extension Int16: SignedArithmeticable {}
extension Int32: SignedArithmeticable {}
extension Int64: SignedArithmeticable {}
extension UInt: Arithmeticable {}
extension UInt8: Arithmeticable {}
extension UInt16: Arithmeticable {}
extension UInt32: Arithmeticable {}
extension UInt64: Arithmeticable {}
extension CGFloat: SignedArithmeticable {}
extension Float32: SignedArithmeticable {}
extension Float64: SignedArithmeticable {}
//extension Float80: SignedArithmeticable {}

public extension Array {
  public func stride(by step: Int) -> [[Element]] {
    var result: [[Element]] = []
    for i in Swift.stride(from: startIndex, to: endIndex, by: step) {
      result.append(Array(self[i..<i+step]))
    }
    return result
  }
}
