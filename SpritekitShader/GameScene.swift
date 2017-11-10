//
//  GameScene.swift
//  SpritekitShader
//
//  Created by Eduard Panasiuk on 11/7/17.
//  Copyright © 2017 Eduard Panasiuk. All rights reserved.
//

import SpriteKit
import OpenGLES
import GameplayKit

class GameScene: SKScene {
    
    private var rootNode:SKSpriteNode?
    
    override func didMove(to view: SKView) {
        
        let node = SKSpriteNode()
        node.size = size
        node.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        let spriteSize = vector_float2(Float(node.frame.size.width),
                                       Float(node.frame.size.height))
        
        let uniforms:[SKUniform] = [
            SKUniform(name: "u_sprite_size", vectorFloat2: spriteSize)
        ]
        
        guard let shaderFile = Bundle.main.path(forResource: "lightningbolt", ofType: "fsh") else {
            return
        }
        
        let shaderURL = URL(fileURLWithPath: shaderFile)
        
        guard let shaderSource = try? String(contentsOf: shaderURL, encoding: .utf8) else {
            return
        }
        
        let shader = SKShader(source: shaderSource, uniforms: uniforms)
                
        node.shader = shader
        
        rootNode = node
        addChild(node)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
