import SceneKit

public extension SCNVector3 {
  static func + (lhs: SCNVector3, rhs: SCNVector3) -> SCNVector3 {
    return SCNVector3(lhs.x + rhs.x,
                      lhs.y + rhs.y,
                      lhs.z + rhs.z)
  }

  static func - (lhs: SCNVector3, rhs: SCNVector3) -> SCNVector3 {
    return SCNVector3(lhs.x - rhs.x,
                      lhs.y - rhs.y,
                      lhs.z - rhs.z)
  }

  static  func * (lhs: SCNVector3, rhs: CGFloat) -> SCNVector3 {
    return SCNVector3(CGFloat(lhs.x) * rhs,
                      CGFloat(lhs.y) * rhs,
                      CGFloat(lhs.z) * rhs)
  }

  static  func / (lhs: SCNVector3, rhs: CGFloat) -> SCNVector3 {
    return SCNVector3(CGFloat(lhs.x) / rhs,
                      CGFloat(lhs.y) / rhs,
                      CGFloat(lhs.z) / rhs)
  }

  var length: CGFloat {
    return CGFloat(sqrt(x * x + y * y + z * z))
  }

  func interpolated(to vec2: SCNVector3, t: CGFloat) -> SCNVector3 {
    return self + (vec2 - self) * t
  }

  func normalized() -> SCNVector3 {
    return self / length
  }

  func rotate(angle: CGFloat, vector: SCNVector3, around: SCNVector3) {

  }
}
