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
    var titleLabel = SKLabelNode(fontNamed: "MyriadPro-Regular")
    var wordLabel = SKLabelNode(fontNamed: "MyriadPro-Regular")
    var eventLabel = SKLabelNode(fontNamed: "MyriadPro-Regular")
    
    /// Aux for display text
    var wordDisplay = ""
    var eventDisplay = ""
    
    /// sprite of player's turn
    var playerTimeSprite: SKSpriteNode?
    
    ///sprite of background turn
    var backgroundImage: SKSpriteNode?
    
    ///sprite npc and baloons events and words
    var npcAngel = SKSpriteNode(imageNamed: "anjoTurno")
    var npcDevil = SKSpriteNode(imageNamed: "demonEvento")
    var baloonWord = SKSpriteNode(imageNamed: "balaoPalavra")
    var baloonEvent = SKSpriteNode(imageNamed: "balaoEvento")
    
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
        playerTimeSprite?.position = CGPoint(x: size.width/2 * 0.55, y: size.height * 0.4)
        playerTimeSprite?.size = CGSize(width: 200, height: 350)
        
        titleLabel.text = String(format: NSLocalizedString("turnComment", comment: ""), player.color)
        titleLabel.text = "It's \(player.color)'s turn"
        titleLabel.fontSize = 75
        titleLabel.fontColor = .white
        titleLabel.position = CGPoint(x: size.width/2 * 0.55, y: size.height/12)
        
        eventLabel.text = eventDisplay
        eventLabel.fontSize = 65
        eventLabel.fontColor = .blue
        eventLabel.position = CGPoint(x: size.width/2 * 1.3, y: size.height/2.3)
        
        backgroundImage = SKSpriteNode(imageNamed: "fundoSorteio")
        backgroundImage?.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundImage?.zPosition = -1
        backgroundImage?.size = size
        
        if eventDisplay.isEmpty{
            
            
            wordLabel.text = wordDisplay
            wordLabel.fontSize = 75
            wordLabel.fontColor = .red
            wordLabel.position = CGPoint(x: size.width/2 * 1.47, y: size.height*0.55)
            
            npcAngel.position = CGPoint(x: size.width/2 * 1.82, y: size.height/3.7)
            npcAngel.size = CGSize(width: 200, height: 450)
            
            baloonWord.position = wordLabel.position
            baloonWord.zPosition = 0
            baloonWord.size = CGSize(width: 400, height: 350)
            
            addChild(npcAngel)
            addChild(baloonWord)
            
        } else {
            npcAngel.position = CGPoint(x: size.width/2 * 1.85, y: size.height/3)
            npcAngel.size = CGSize(width: 200, height: 400)
            npcDevil.position = CGPoint(x: size.width/2 * 1.65, y: size.height/5)
            npcDevil.size = CGSize(width: 200, height: 400)

            baloonEvent.position = eventLabel.position
            baloonEvent.zPosition = 0
            baloonEvent.size = CGSize(width: 400, height: 280)

            wordLabel.text = wordDisplay
            wordLabel.fontSize = 65
            wordLabel.fontColor = .red
            wordLabel.position = CGPoint(x: size.width/2 * 1.6, y: size.height/1.6)

            baloonWord.position = wordLabel.position
            baloonWord.zPosition = 0
            baloonWord.size = CGSize(width: 300, height: 250)

            addChild(npcAngel)
            addChild(npcDevil)
            addChild(baloonEvent)
            addChild(baloonWord)
            
        }
        
        
        addChild(backgroundImage!)
        addChild(playerTimeSprite!)
        addChild(titleLabel)
        addChild(wordLabel)
        addChild(eventLabel)
        
    }
}
