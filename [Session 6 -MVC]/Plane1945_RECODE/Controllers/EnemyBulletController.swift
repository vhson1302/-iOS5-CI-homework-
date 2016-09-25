//
//  EnemyBulletController.swift
//  Plane1945_RECODE
//
//  Created by SonVu on 9/25/16.
//  Copyright © 2016 SonVu. All rights reserved.
//

import SpriteKit

class EnemyBulletController : Controller {
    let SPEED : Double = 300
    
    override func setup(parent: SKNode) {
        addFlyAction(parent: parent)
        configPhysics()
    }
    
    override func configPhysics() {
        view.physicsBody = SKPhysicsBody(rectangleOf: view.frame.size)
        
        view.physicsBody?.categoryBitMask = PHYSICS_MASK_ENEMY_BULLET
        view.physicsBody?.collisionBitMask = 0
        view.physicsBody?.contactTestBitMask = PHYSICS_MASK_PLAYER
    }
    
    func addFlyAction(parent : SKNode) -> Void {
        //        // 1
        //        let distance = Double(parent.frame.maxY)
        //        //2
        //        let time = distance / SPEED
        //        //3
        //        self.view.run(
        //            SKAction.sequence([
        //                SKAction.moveTo(y: parent.frame.minY, duration: time),
        //                SKAction.removeFromParent()
        //                ])
        //        )
        
        
        let enemyBulletFly = SKAction.moveBy(x: 0, y: -30, duration: 0.1)
        self.view.run(SKAction.repeatForever(enemyBulletFly))
        
        
    }
}
