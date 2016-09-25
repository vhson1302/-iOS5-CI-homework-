//
//  GameViewController.swift
//  Plane1945_RECODE
//
//  Created by SonVu on 9/24/16.
//  Copyright © 2016 SonVu. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1 cast view to skView and configure view
        let skView = self.view as! SKView
        skView.showsNodeCount = true
        skView.showsFPS = true
        
        //2 create game scene
        let menuScene = GameMenuScene(size: skView.frame.size)
        
        //3 present game scene
        skView.presentScene(menuScene)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
