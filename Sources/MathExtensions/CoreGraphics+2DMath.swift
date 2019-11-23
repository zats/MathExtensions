import CoreGraphics

// MARK: - Tuple2Expressable CG types conformance

extension CGSize: Tuple2Expressable {
  public init(_ tuple2Value: (CGFloat, CGFloat)) {
    self.init(width: tuple2Value.0, height: tuple2Value.1)
  }
  
  public var tuple2Value: (CGFloat, CGFloat) {
    return (width, height)
  }
}

extension CGPoint: Tuple2Expressable {
  public init(_ tuple2Value: (CGFloat, CGFloat)) {
    self.init(x: tuple2Value.0, y: tuple2Value.1)
  }
  
  public var tuple2Value: (CGFloat, CGFloat) {
    return (x, y)
  }
}

extension CGVector: Tuple2Expressable {
  public init(_ tuple2Value: (CGFloat, CGFloat)) {
    self.init(dx: tuple2Value.0, dy: tuple2Value.1)
  }
  
  public var tuple2Value: (CGFloat, CGFloat) {
    return (dx, dy)
  }
}

