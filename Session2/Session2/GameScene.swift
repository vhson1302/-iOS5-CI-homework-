//
//  GameScene.swift
//  Session2
//
//  Created by SonVu on 9/5/16.
//  Copyright (c) 2016 SonVu. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var plane : SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        addBackGround()
        addPlane()
    }
    
    //addBackGround
    func addBackGround() {
        //1
        let backGround = SKSpriteNode(imageNamed: "background.png")
        //2 fit to the screen
        backGround.anchorPoint = CGPointZero
        //3 add to view
        addChild(backGround)
    }
    
    //addPlane
    func addPlane() {
        //1
        plane = SKSpriteNode(imageNamed: "plane2.png")
        //2 position
        plane.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        // add
        addChild(plane)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        //        print("Touch begin")
        //        if let touch = touches.first {
        //            let touchPosition = touch.locationInNode(self)
        //            plane.position = CGPoint(x: touchPosition.x, y: touchPosition.y)
        //        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("Touch move")
        print("touch count: \(touches.count)")
        //print(touches.first)
        
        if let touch = touches.first {
            //1 position of touch
            let currentTouchLocation = touch.locationInNode(self)
            let previousTouchLocation = touch.previousLocationInNode(self)
            //2 calculate movement vector
            let dx = currentTouchLocation.x - previousTouchLocation.x
            let dy = currentTouchLocation.y - previousTouchLocation.y
            //3 postion of plane
            var planeNewX = plane.position.x + dx
            var planeNewY = plane.position.y + dy
            //plane.position = CGPoint(x: planeNewX, y: planeNewY)
            if (planeNewX > self.frame.size.width) {
                planeNewX = self.frame.size.width
            }
            if planeNewX < 0 {
                planeNewX = 0
            }
            if planeNewY > self.frame.size.height {
                planeNewY = self.frame.size.height
            }
            if planeNewY < 0 {
                planeNewY = 0
            }
            plane.position = CGPoint(x: planeNewX, y: planeNewY)
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
