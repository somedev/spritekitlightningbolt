//
//  GameScene.swift
//  SpritekitShader
//
//  Created by Eduard Panasiuk on 11/7/17.
//  Copyright © 2017 Eduard Panasiuk. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var rootNode:SKSpriteNode?
    
    override func didMove(to view: SKView) {
        
        let node = SKSpriteNode()
        node.size = size
        node.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        let shader = SKShader(fileNamed: "lightning.fsh")
        
        node.shader = shader
        
        rootNode = node
        addChild(node)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
