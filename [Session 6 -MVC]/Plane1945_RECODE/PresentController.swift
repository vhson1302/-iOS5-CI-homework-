//
//  PresentController.swift
//  Plane1945_RECODE
//
//  Created by SonVu on 9/25/16.
//  Copyright © 2016 SonVu. All rights reserved.
//

import SpriteKit

class PresentController: Controller {
    let SPEED : Double = 1000
    
    override func setup(parent: SKNode) {
        configPhysics()
        addBullet(parent: parent)
    }
    
    override func configPhysics() {
        view.physicsBody = SKPhysicsBody(rectangleOf: view.frame.size)
        
        view.physicsBody?.categoryBitMask = PHYSICS_MASK_PRESENT
        view.physicsBody?.collisionBitMask = 0
        view.physicsBody?.contactTestBitMask = PHYSICS_MASK_PLAYER
    }
    
    func addBullet(parent : SKNode) -> Void {
        // 1
        //        let distanceToRoof = Double(parent.frame.maxY)
        //        // 2
        //        let timeToReachRoof = distanceToRoof / SPEED
        //        // 3
        //        self.view.run(
        //            SKAction.sequence([
        //                SKAction.moveTo(y: parent.frame.size.height, duration: timeToReachRoof),
        //                SKAction.removeFromParent()
        //                ])
        //        )
        
        let enemyFly = SKAction.moveBy(x: 0, y: -10, duration: 0.1)
        self.view.run(SKAction.repeatForever(enemyFly))
        
    }
}
