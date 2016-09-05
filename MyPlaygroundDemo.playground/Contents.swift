//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print(str)
var str1 = "lalala"

var x = 5

x = 5 + 10

let a : String = "5"

a.dynamicType

// ? vs !
var b : Int?
b = 6
if var unwrapped_b = b {
    unwrapped_b = 9
    b!
}


var className = "iOS5-CI"
//className = nil


extension CGPoint {
    func multiple(a : CGFloat) -> CGPoint {
        let getX = self.x * a
        let getY = self.y * a
        return CGPoint(x: getX, y: getY)
    }
    
    func distance(other : CGPoint) -> CGFloat {
        let deltaX = (other.x - self.x)*(other.x - self.x)
        let deltaY = (other.y - self.y)*(other.y - self.y)
        return sqrt(deltaX + deltaY)
    }
    
    func vectorNormalize(distance : CGFloat, secondPoint : CGPoint) -> CGPoint {
        let vectorX = secondPoint.x - self.x
        let vectorY = secondPoint.y - self.y
        let normalizX = vectorX / abs(distance)
        let normalizY = vectorY / abs(distance)
        return CGPoint(x: normalizX, y: normalizY)
    }
}



print("Start Test")

let q1 = CGPoint(x: 5, y: 6)
let q2 = CGPoint(x: 10, y: 15)

print("Nhan 4 = \(q1.multiple(4) )")
print("Khoang canh: \(q1.distance(q2))")
print("normalize: \(q1.vectorNormalize(q1.distance(q2), secondPoint: q2))")












