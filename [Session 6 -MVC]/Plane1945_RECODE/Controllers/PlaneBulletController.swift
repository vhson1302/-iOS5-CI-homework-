//
//  PlaneBulletController.swift
//  Plane1945_RECODE
//
//  Created by SonVu on 9/25/16.
//  Copyright © 2016 SonVu. All rights reserved.
//

import SpriteKit

class PlaneBulletController: Controller {
    let SPEED : Double = 800
    
    override func setup(parent: SKNode) {
        addFlyAction(parent: parent)
        configPhysics()
    }
    
    override func configPhysics() {
        view.physicsBody = SKPhysicsBody(rectangleOf: view.frame.size)
        
        view.physicsBody?.categoryBitMask = PHYSICS_MASK_PLAYER_BULLET
        view.physicsBody?.collisionBitMask = 0
        view.physicsBody?.contactTestBitMask = PHYSICS_MASK_ENEMY | PHYSICS_MASK_ENEMY_BULLET

    }
    
    func addFlyAction(parent : SKNode) -> Void {
        // 1
        let distanceToRoof = Double(parent.frame.maxY)
        // 2
        let timeToReachRoof = distanceToRoof / SPEED
        // 3
        self.view.run(
            SKAction.sequence([
                SKAction.moveTo(y: parent.frame.size.height, duration: timeToReachRoof),
                SKAction.removeFromParent()
                ])
        )
    }
    
}
