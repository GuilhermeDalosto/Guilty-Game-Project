//
//  TurnScene.swift
//  GuiltyGameProject
//
//  Created by Ferraz on 28/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import SpriteKit

/**
 Class responsable to show someone's turn
 */
class TurnScene: SKScene{
    
  
    /// text to say how is the turn now
    var titleLabel = SKLabelNode(fontNamed: "")
    var wordLabel = SKLabelNode(fontNamed: "")
    var eventLabel = SKLabelNode(fontNamed: "")
    
    /// Aux for display text
    var wordDisplay = ""
    var eventDisplay = ""
    
    /// sprite of player's turn
    var playerTimeSprite: SKSpriteNode?
    
    /**
     Init the turn scene
     */
    init(size: CGSize, player: Person,word: String,event: String){
        super.init(size: size)
        
        // setup scene with elements
        wordDisplay = word
        eventDisplay = event
        setupScene(player: player)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Add elements (player's pin and title label) to the scene
     */
    func setupScene(player: Person){
        
        playerTimeSprite = SKSpriteNode(imageNamed: "pin\(player.color)")
        playerTimeSprite?.position = CGPoint(x: size.width/2, y: size.height * 0.4)
        
        titleLabel.text = "It's \(player.color)'s turn"
        titleLabel.fontSize = 50
        titleLabel.fontColor = .red
        titleLabel.position = CGPoint(x: size.width/2, y: size.height/4)
        
        wordLabel.text = wordDisplay
        wordLabel.fontSize = 90
        wordLabel.fontColor = .white
        wordLabel.position = CGPoint(x: size.width/2, y: size.height*0.75)
        
        eventLabel.text = eventDisplay
        eventLabel.fontSize = 90
        eventLabel.fontColor = .blue
        eventLabel.position = CGPoint(x: size.width/2, y: size.height/8)
        
        
        addChild(playerTimeSprite!)
        addChild(titleLabel)
        addChild(wordLabel)
        addChild(eventLabel)
    }
}
