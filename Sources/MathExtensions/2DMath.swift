import Foundation

// MARK: - Value types

/// Values type that can be expressed by 2 elements
public protocol Tuple2Expressable {
  associatedtype Element
  
  init(_ tuple2Value: (Element, Element))
  
  var tuple2Value: (Element, Element) { get }
}

public extension Tuple2Expressable {
  public init<T: Tuple2Expressable>(_ another: T) where T.Element == Self.Element {
    self.init(another.tuple2Value)
  }
}

// MARK: - Multipliable

extension Tuple2Expressable where Element: Multipliable {
  public static func *(lhs: Self, rhs: Element) -> Self {
    let tuple = lhs.tuple2Value
    return Self((tuple.0 * rhs,
                 tuple.1 * rhs))
  }
  
  public static func *(lhs: Element, rhs: Self) -> Self {
    return rhs * lhs
  }
}

// MARK: - Divisible

extension Tuple2Expressable where Element: Divisable {
  public static func /(lhs: Self, rhs: Element) -> Self {
    let tuple = lhs.tuple2Value
    return Self((tuple.0 / rhs,
                 tuple.1 / rhs))
  }
}

// MARK: - Addable

extension Tuple2Expressable where Element: Addable {
  // this is to aid complier: when both types are the same,
  // prefer to return the same type, unless return type explicitly specified
  public static func +(lhs: Self, rhs: Self) -> Self {
    let lhsTuple = lhs.tuple2Value
    let rhsTuple = rhs.tuple2Value
    return Self((lhsTuple.0 + rhsTuple.0,
                 lhsTuple.1 + rhsTuple.1))
  }
  
  public static func +<T: Tuple2Expressable, U: Tuple2Expressable>(lhs: Self, rhs: T) -> U where T.Element == Element, U.Element == Element {
    let lhsTuple = lhs.tuple2Value
    let rhsTuple = rhs.tuple2Value
    return U((lhsTuple.0 + rhsTuple.0,
              lhsTuple.1 + rhsTuple.1))
  }
}

// MARK: - Subtractable

extension Tuple2Expressable where Element: Subtractable {
  // this is to aid complier: when both types are the same,
  // prefer to return the same type, unless return type explicitly specified
  public static func -(lhs: Self, rhs: Self) -> Self {
    let lhsTuple = lhs.tuple2Value
    let rhsTuple = rhs.tuple2Value
    return Self((lhsTuple.0 - rhsTuple.0,
                 lhsTuple.1 - rhsTuple.1))
  }
  
  public static func -<T: Tuple2Expressable, U: Tuple2Expressable>(lhs: Self, rhs: T) -> U where T.Element == Element, U.Element == Element {
    let lhsTuple = lhs.tuple2Value
    let rhsTuple = rhs.tuple2Value
    return U((lhsTuple.0 - rhsTuple.0,
              lhsTuple.1 - rhsTuple.1))
  }
}

// MARK: - Negetable

extension Tuple2Expressable where Element: Negetable {
  public static prefix func -(lhs: Self) -> Self {
    let tuple = lhs.tuple2Value
    return Self((-tuple.0, -tuple.1))
  }
}
