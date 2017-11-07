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
        
        let uniforms:[SKUniform] = [
            SKUniform(name: "offset", float: 0),
            SKUniform(name: "amp", float: 1.0),
            SKUniform(name: "speed", float: 0.8),
            SKUniform(name: "l_scale", float: 1.0),
            SKUniform(name: "h_scale", float: 1.0),
            SKUniform(name: "y_scale", float: 0.2),
            SKUniform(name: "noOfBolts", float: 5),
            SKUniform(name: "gamma", float: 1.0),
            SKUniform(name: "brightness", float: 1.0),
            SKUniform(name: "tint", float: 0.75),
            SKUniform(name: "contrast", float: 1.0),
            SKUniform(name: "locked", float: 1),
            SKUniform(name: "tint_col", vectorFloat3: vector_float3([0.3, 0.6, 1.0])),
            SKUniform(name: "posA", vectorFloat2: vector_float2([0, 0.5])),
            SKUniform(name: "posB", vectorFloat2: vector_float2([0.7, 0.5])),
            SKUniform(name: "posC", vectorFloat2: vector_float2([1.0, 0.5]))
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
