//
//  GameScene.swift
//  Plane1945_RECODE
//
//  Created by SonVu on 9/24/16.
//  Copyright © 2016 SonVu. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var enemy : SKSpriteNode!
    
    var planeController : PlaneController!
    var enemyController : EnemyController!
    
    override func didMove(to view: SKView) {
        addBackground()
        addPlane()
        addEnemy()
        addPresent()
        addSimpleNode()
        configurePhysic()
        
    }
    
    //PHYSICS
    func configurePhysic() {
        //1.
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        //2.delegate
        self.physicsWorld.contactDelegate = self
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("didBegin")
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        let maskA = bodyA.categoryBitMask
        let maskB = bodyB.categoryBitMask
        
        if ((maskA | maskB) == (PHYSICS_MASK_ENEMY | PHYSICS_MASK_PLAYER_BULLET)) || ((maskA | maskB) == (PHYSICS_MASK_PLAYER | PHYSICS_MASK_ENEMY)) || ((maskA | maskB) == (PHYSICS_MASK_ENEMY_BULLET | PHYSICS_MASK_PLAYER)){
            self.run(SKAction.playSoundFileNamed("explosion.wav", waitForCompletion: false))
            //1
            let particle = SKEmitterNode(fileNamed: "explosion.sks")
            particle?.position = (bodyA.node?.position)!
            //2
            addChild(particle!)
            
            bodyA.node?.removeFromParent()
            bodyB.node?.removeFromParent()
        }
        if ((maskA | maskB) == (PHYSICS_MASK_PRESENT | PHYSICS_MASK_PLAYER)) {
            print("OKKK")
            planeController.changeType(parent: self)
            if maskA == PHYSICS_MASK_PRESENT {
                bodyA.node?.removeFromParent()
            }
            if maskB == PHYSICS_MASK_PRESENT {
                bodyB.node?.removeFromParent()
            }
            
        }
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        print("didEnd")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchNodes = self.nodes(at: location)
            for node in touchNodes {
                if(node.name == "simple") {
                    print("Simple node has been touched")
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            // 1
            let currentTouchPosition = touch.location(in: self)
            let previousTouchPosition = touch.previousLocation(in: self)
            // 2 Calculate movement vector and then move the plane by this vector
            planeController.moveBy(vector: currentTouchPosition.subtract(other: previousTouchPosition))
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    //ADD LABEL
    func addSimpleNode()  {
        let simpleNode = SKLabelNode(text: "0")
        simpleNode.name = "simple"
        simpleNode.position = CGPoint(x: 10, y: 10)
        addChild(simpleNode)
    }
    
    //ADD PLANE
    func addPlane() {
        // 1
        let planeView = SKSpriteNode(imageNamed: "plane2.png")
        // 2
        planeView.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        // 3
        planeController = PlaneController(view: planeView)
        planeController.setup(parent: self)
        //4
        addChild(planeView)
    }
    
    //ADD ENEMY
    func addEnemy() {
        let enemySpawn = SKAction.run {
            //1
            let enemy = SKSpriteNode.init(imageNamed: "enemy_plane_white_1.png")
            //2
            let enemyPositionX = (CGFloat)(arc4random_uniform(UInt32(self.frame.size.width)))
            enemy.position = CGPoint(x: enemyPositionX, y: self.frame.maxY)
            //3
            self.enemyController = EnemyController(view: enemy)
            self.enemyController.setup(parent: self)
            self.addChild(enemy)
        }
        let period = SKAction.sequence([enemySpawn, SKAction.wait(forDuration: 3)])
        self.run(SKAction.repeatForever(period))
    }
    
    //ADD PRESENT
    func addPresent() {
        let presentSpawn = SKAction.run {
            //1
            let enemy = SKSpriteNode.init(imageNamed: "power-up.png")
            //2
            let enemyPositionX = (CGFloat)(arc4random_uniform(UInt32(self.frame.size.width)))
            enemy.position = CGPoint(x: enemyPositionX, y: self.frame.maxY)
            //3
//            let enemyFly = SKAction.moveBy(x: 0, y: -10, duration: 0.1)
//            enemy.run(SKAction.repeatForever(enemyFly))
//            self.addChild(enemy)
            let presentController = PresentController(view: enemy)
            presentController.setup(parent: self)
            self.addChild(enemy)
        }
        let period = SKAction.sequence([presentSpawn, SKAction.wait(forDuration: 10)])
        self.run(SKAction.repeatForever(period))
    }
    
    
    
    
    //ADD BACKGROUND
    func addBackground()  {
        // 1
        let background = SKSpriteNode(imageNamed: "background.png")
        // 2
        background.anchorPoint = CGPoint(x: 0, y: 0)
        background.position = CGPoint(x: 0, y: 0)
        // 3
        addChild(background)
    }
    
}
