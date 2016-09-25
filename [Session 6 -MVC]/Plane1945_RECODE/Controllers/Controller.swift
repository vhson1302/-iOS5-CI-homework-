//
//  Controller.swift
//  Plane1945_RECODE
//
//  Created by SonVu on 9/25/16.
//  Copyright © 2016 SonVu. All rights reserved.
//

import SpriteKit

class Controller {
    let view : SKSpriteNode
    
    init(view : SKSpriteNode) {
        self.view = view
    }
    
    func setup(parent : SKNode) -> Void {
        
    }
    
    func configPhysics() -> Void {
        
    }
    
    // Move to a specific position
    func moveTo(position: CGPoint) -> Void {
        self.view.position = position
    }
    
    // Move by a vector
    func moveBy(vector: CGPoint) -> Void {
        let newPosition = self.view.position.add(other: vector)
        self.view.position = newPosition
    }

}
