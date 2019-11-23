import CoreGraphics

public extension Range where Bound == CGFloat {
  public func denormalize(_ value: CGFloat) -> CGFloat {
    return value * (self.upperBound - self.lowerBound) + self.lowerBound
  }
}

public extension CGFloat {
  public func normalized(in range: Range<CGFloat>) -> CGFloat {
    return self / (range.upperBound - range.lowerBound)
  }

  public func lerp(from oldRange: Range<CGFloat>, to newRange: Range<CGFloat>) -> CGFloat {
    return newRange.denormalize(self.normalized(in: oldRange))
  }
}
