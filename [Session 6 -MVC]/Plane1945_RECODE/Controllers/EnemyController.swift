//
//  EnemyController.swift
//  Plane1945_RECODE
//
//  Created by SonVu on 9/25/16.
//  Copyright © 2016 SonVu. All rights reserved.
//

import SpriteKit

class EnemyController: Controller {
    let SHOT_DURATION = 0.8
    let SPEED : Double = 100
    
    override func setup(parent: SKNode) {
        addTexture(parent: parent)
        addFlyAction(parent: parent)
        addShotAction(parent: parent)
        configPhysics()
    }
    
    override func configPhysics() {
        view.physicsBody = SKPhysicsBody(rectangleOf: view.frame.size)
        
        view.physicsBody?.categoryBitMask = PHYSICS_MASK_ENEMY
        view.physicsBody?.collisionBitMask = 0
        view.physicsBody?.contactTestBitMask = PHYSICS_MASK_PLAYER_BULLET | PHYSICS_MASK_PLAYER
    }
    
    func addFlyAction(parent : SKNode) -> Void {
        // 1
        let distanceToBottom = Double(parent.frame.maxY)
        // 2
        let timeToReachBottom = distanceToBottom / SPEED
        // 3
        self.view.run(
            SKAction.sequence([
                SKAction.moveTo(y: parent.frame.minY, duration: timeToReachBottom),
                SKAction.removeFromParent()
                ])
        )
    }
    
    func addTexture(parent : SKNode) -> Void {
        var textures : [SKTexture] = []
        let nameFormat = "enemy_plane_white_"
        for i in 1...3 {
            let fileName = "\(nameFormat)\(i).png"
            //print(fileName)
            let texture = SKTexture(imageNamed: fileName)
            textures.append(texture)
        }
        let animate = SKAction.animate(with: textures, timePerFrame: 0.02)
        view.run(SKAction.repeatForever(animate))
    }
    
    func addEnemyBullet(parent : SKNode) -> Void {
        //let enemyBullet = SKAction.run {
            //1
            let enemyBullet = SKSpriteNode.init(imageNamed: "enemy_bullet.png")
            //2
            enemyBullet.position = CGPoint(x: self.view.position.x, y: self.view.position.y)
            //3
            let enemyBulletControl = EnemyBulletController(view: enemyBullet)
            enemyBulletControl.setup(parent: parent)
            //4
            parent.addChild(enemyBullet)
    //}
        //let periodEnemyBullet = SKAction.sequence([enemyBullet, SKAction.wait(forDuration: 0.7)])
        //parent.run(SKAction.repeatForever(periodEnemyBullet))
        
    }
    
    func addShotAction(parent : SKNode) -> Void {
        self.view.run(
            SKAction.repeatForever(
                SKAction.sequence(
                    [
                        SKAction.run { self.addEnemyBullet(parent: parent)},
                        SKAction.wait(forDuration: SHOT_DURATION)
                    ]
                )
            )
        )
    }
}

