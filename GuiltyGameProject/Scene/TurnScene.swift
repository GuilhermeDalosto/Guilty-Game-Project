//
//  TurnScene.swift
//  GuiltyGameProject
//
//  Created by Ferraz on 28/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import SpriteKit

class TurnScene: SKScene{
    
    /// text to say how is the turn now
    var titleLabel = SKLabelNode(fontNamed: "")
    /// sprite of player's turn
    var playerTimeSprite: SKSpriteNode?
    
    /**
     Init the turn scene
     */
    init(size: CGSize, player: Person){
        super.init(size: size)
        
        // setup scene with elements
        setupScene(player: player)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Add elements (player's pin and title label) to the scene
     */
    func setupScene(player: Person){
        playerTimeSprite = SKSpriteNode(imageNamed: "pin_\(player.color)")
        playerTimeSprite?.position = CGPoint(x: size.width/2, y: size.height * 0.4)
        
        titleLabel.text = "The turn of"
        titleLabel.fontSize = 30
        titleLabel.fontColor = .red
        titleLabel.position = CGPoint(x: size.width/2, y: size.height/2 * 0.6)
        
        addChild(playerTimeSprite!)
        addChild(titleLabel)
    }
}
