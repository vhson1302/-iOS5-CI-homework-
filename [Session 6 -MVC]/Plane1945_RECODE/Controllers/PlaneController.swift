//
//  PlaneController.swift
//  Plane1945_RECODE
//
//  Created by SonVu on 9/25/16.
//  Copyright © 2016 SonVu. All rights reserved.
//

import SpriteKit

class PlaneController: Controller {
    
    let SHOT_DURATION = 0.5
    
    override func setup(parent: SKNode) {
        addShotAction(parent: parent)
        configPhysics()
    }
    
    func changeType(parent : SKNode) -> Void {
        addShotActionDouble(parent: parent)
        configPhysics()
    }
    
    override func configPhysics() {
        view.physicsBody = SKPhysicsBody(rectangleOf: view.frame.size)
        
        view.physicsBody?.categoryBitMask = UInt32(PHYSICS_MASK_PLAYER)
        view.physicsBody?.collisionBitMask = 0
        view.physicsBody?.contactTestBitMask = (PHYSICS_MASK_ENEMY | PHYSICS_MASK_ENEMY_BULLET)
    }
    
    func addTwoBullet(parent : SKNode) -> Void {
        
        // 1
        let bulletView1 = SKSpriteNode(imageNamed: "bullet.png")
        let bulletView2 = SKSpriteNode(imageNamed: "bullet.png")
        // 2
        bulletView1.position.x = view.position.x - 20
        bulletView1.position.y = view.position.y + 50
        bulletView2.position.x = view.position.x + 20
        bulletView2.position.y = view.position.y + 50
        // 3
        let planeBulletController1 = PlaneBulletController(view: bulletView1)
        let planeBulletController2 = PlaneBulletController(view: bulletView2)
        // 4
        planeBulletController1.setup(parent: parent)
        planeBulletController2.setup(parent: parent)
        // x
        parent.addChild(bulletView1)
        parent.addChild(bulletView2)
    }
    
    func addPlaneBullet(parent : SKNode) -> Void {
        // 1
        let bulletView = SKSpriteNode(imageNamed: "bullet.png")
        // 2
        bulletView.position.x = view.position.x
        bulletView.position.y = view.position.y + 50
        // 3
        let planeBulletController = PlaneBulletController(view: bulletView)
        // 4
        planeBulletController.setup(parent: parent)
        // x
        parent.addChild(bulletView)
        
    }
    
    
    func addShotAction(parent : SKNode) -> Void {
        self.view.run(
            SKAction.repeatForever(
                SKAction.sequence(
                    [
                        SKAction.run {
                            self.addPlaneBullet(parent: parent)
                        },
                        SKAction.wait(forDuration: SHOT_DURATION),
                        SKAction.playSoundFileNamed("planeshot.wav", waitForCompletion: false)
                    ]
                )
            )
        )
        
    }
    
    func addShotActionDouble(parent : SKNode) -> Void {
        self.view.run(
            SKAction.repeatForever(
                SKAction.sequence(
                    [
                        SKAction.run {
                            self.addTwoBullet(parent: parent)
                        },
                        SKAction.wait(forDuration: SHOT_DURATION),
                        SKAction.playSoundFileNamed("planeshot.wav", waitForCompletion: false)
                    ]
                )
            )
        )
        
    }
    
}
