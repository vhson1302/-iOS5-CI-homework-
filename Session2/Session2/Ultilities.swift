//
//  Ultilities.swift
//  Session2
//
//  Created by SonVu on 9/5/16.
//  Copyright © 2016 SonVu. All rights reserved.
//

import Foundation
import SpriteKit

extension CGPoint {
    func add(other : CGPoint) -> CGPoint {
        let retX = self.x + other.x
        let retY = self.y + other.y
        return CGPoint(x: retX, y: retY)
    }
    
    func substract(other : CGPoint) -> CGPoint {
        let retX = self.x - other.x
        let retY = self.y - other.y
        return CGPoint(x: retX, y: retY)
    }
    
    func multiple(a : CGFloat) -> CGPoint {
        let retX = self.x * a
        let retY = self.y * a
        return CGPoint(x: retX, y: retY)
    }
}

