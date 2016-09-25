//
//  GameMenuScene.swift
//  Plane1945_RECODE
//
//  Created by SonVu on 9/25/16.
//  Copyright © 2016 SonVu. All rights reserved.
//

import Foundation
import SpriteKit

class GameMenuScene: SKScene {
    override func didMove(to view: SKView) {
        let label = SKLabelNode(text: "Tap to start")
        label.fontName = "Tahoma"
        label.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        addChild(label)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //1 creat secent
        let gameScene = GameScene(size: (self.view?.frame.size)!)
        //2 transport
        self.view?.presentScene(gameScene, transition: SKTransition.fade(with: UIColor.black, duration: 0.5))
    }
}
