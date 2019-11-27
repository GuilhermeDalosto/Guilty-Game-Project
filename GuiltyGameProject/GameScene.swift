//
//  GameScene.swift
//  GuiltyGameProject
//
//  Created by Ferraz on 26/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import SpriteKit

class GameScene: SKScene{
    let backgroundSprite = SKSpriteNode(imageNamed: "1")
    let pinsSprite = [SKSpriteNode]()
    let eventSprite = SKSpriteNode(imageNamed: "2")
    
    override init() {
        super.init()
        backgroundSprite.position = CGPoint(x: 0, y: 0)
        eventSprite.position = CGPoint(x: self.size.width/2, y: size.height/2)
        backgroundColor = UIColor.red
        self.addChild(backgroundSprite)
        self.addChild(eventSprite)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
