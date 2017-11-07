//
//  GameViewController.swift
//  SpritekitShader
//
//  Created by Eduard Panasiuk on 11/7/17.
//  Copyright © 2017 Eduard Panasiuk. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            let scene = GameScene(size: view.bounds.size)
            scene.scaleMode = .aspectFill
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
            
            view.presentScene(scene)
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("\n======\nMemory pressure!!!\n======\n")
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
