//
//  GameScene.swift
//  Session1
//
//  Created by Apple on 8/28/16.
//  Copyright (c) 2016 TechKids. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    // Nodes
    var plane:SKSpriteNode!
    var enemy: SKSpriteNode!
    var planeBullets : [SKSpriteNode] = []
    var enemies : [SKSpriteNode] = []
    var enemyBullets : [SKSpriteNode] = []
    //
    var lastUpdateTime : NSTimeInterval = -1
    
    // Counters
    var bulletIntervalCount = 0
    var enemyIntervalCount = 0
    
    var previousTime : NSTimeInterval = -1
    
    override func didMoveToView(view: SKView) {
        addBackground()
        addPlane()
        addEnemies()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touchesBegan")
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touchesMoved")
        print("touches count: \(touches.count)")
        if let touch = touches.first {
            // 1
            let currentTouchPosition = touch.locationInNode(self)
            let previousTouchPosition = touch.previousLocationInNode(self)
            
            // 2 Calculate movement vector and then move the plane by this vector
            plane.position = currentTouchPosition.subtract(previousTouchPosition).add(plane.position)
        }
    }
    
    //UPDATE
    override func update(currentTime: NSTimeInterval) {
        print("\(currentTime)")
        if previousTime == -1 {
            previousTime = currentTime
        } else {
            let deltaTime = currentTime - previousTime
            
            if deltaTime > 3 {
                addEnemies()
                previousTime = currentTime
            }
        }

        
        
        for (bulletIndex, bullet) in planeBullets.enumerate() {
            for (enemyIndex, enemy) in enemies.enumerate() {
                // 1
                let bulletFrame = bullet.frame
                let enemyFrame = enemy.frame
                
                // 2
                if CGRectIntersectsRect(bulletFrame, enemyFrame) {
                    // 3
                    bullet.removeFromParent()
                    enemy.removeFromParent()
                    
                    // 4
                    planeBullets.removeAtIndex(bulletIndex)
                    enemies.removeAtIndex(enemyIndex)
                }
            }
        }
        
        
    }
    
    
    //ADD PLANE BULLET
    func addPlaneBullet() {
        // 1
        let bullet = SKSpriteNode(imageNamed: "bullet.png")
        
        // 2
        bullet.position.x = plane.position.x
        bullet.position.y = plane.position.y + 50
        
        // 3
        self.addChild(bullet)
        
        // 4
        let bulletFly = SKAction.moveByX(0, y: 20, duration: 0.08)
        
        // 5
        bullet.runAction(SKAction.repeatActionForever(bulletFly))
        
        // 5
        planeBullets.append(bullet)
    }
    
//    //ADD BULLET ENEMY
//    func addBulletEnemy() {
//        let bullet = SKSpriteNode.init(imageNamed: "enemy_bullet.png")
//        bullet.position.x = enemy.position.x
//        bullet.position.y = enemy.position.y - 50
//        self.addChild(bullet)
//        let bulletEnemyFly = SKAction.moveByX(0, y: -20, duration: 0.08)
//        bullet.runAction(SKAction.repeatActionForever(bulletEnemyFly))
//        enemyBullets.append(bullet)
//    }
    
    //ADD ENEMY
    func addEnemies() {
        let enemy = SKSpriteNode.init(imageNamed: "plane1.png")
        let enemyPositionX = (CGFloat)(arc4random_uniform(UInt32(self.frame.size.width)))
        enemy.position.x = enemyPositionX
        enemy.position.y = self.frame.height
//        let enemyShot = SKAction.runBlock {
//            //self.addBulletEnemy()
//        }
        
        //let periodShot = SKAction.sequence([enemyShot, SKAction.waitForDuration(0.5)])
        //let shotForever = SKAction.repeatActionForever(periodShot)
        let enemyFly = SKAction.moveByX(0, y: -20, duration: 0.08)
        //enemy.runAction(<#T##action: SKAction##SKAction#>)
        enemy.runAction(SKAction.repeatActionForever(enemyFly))
        addChild(enemy)
    }
    

    
    //ADD PLANE
    func addPlane() {
        // 1
        plane = SKSpriteNode(imageNamed: "plane2.png")
        
        // 2
        plane.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        
        // 3
        let shot = SKAction.runBlock {
            self.addPlaneBullet()
        }
        let periodShot = SKAction.sequence([shot, SKAction.waitForDuration(0.5)])
        let shotForever = SKAction.repeatActionForever(periodShot)
        
        // 4
        plane.runAction(shotForever)
        
        // 5
        addChild(plane)
    }
    
    //ADD BACKGROUND
    func addBackground() {
        // 1
        let background = SKSpriteNode(imageNamed: "background.png")
        
        // 2
        background.anchorPoint = CGPointZero
        background.position = CGPointZero
        
        // 3
        addChild(background)
    }
    
    
    
}
