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
    
    var titleEvent = SKLabelNode(fontNamed: "MyriadPro-Regular")
    var titleWord = SKLabelNode(fontNamed: "MyriadPro-Regular")
    
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
        print(player.color)
        playerTimeSprite = SKSpriteNode(imageNamed: "\(player.color)Turn")
        playerTimeSprite?.position = CGPoint(x: size.width/2 * 0.55, y: size.height * 0.4)
        playerTimeSprite?.size = CGSize(width: 250, height: 475)
        
        titleLabel.text = String(format: NSLocalizedString("turnComment", comment: ""), player.color)
        
        titleLabel.fontSize = 75
        titleLabel.fontColor = .white
        titleLabel.position = CGPoint(x: size.width/2 * 0.55, y: size.height/12)
        
        eventLabel.text = eventDisplay
        eventLabel.fontColor = .black
//        eventLabel.position = CGPoint(x: size.width/2 * 1.3, y: size.height/2.5)
//        eventLabel.lineBreakMode = .byWordWrapping
       
        wordLabel.text = wordDisplay
        wordLabel.fontColor = .black
        
        baloonEvent.size = CGSize(width: 420, height: 280)
        
        
        titleEvent.position = CGPoint(x: size.width/2 * 1.3, y: size.height/2)
        titleEvent.fontColor = .black
        titleEvent.text = "Evento"
        titleEvent.fontSize = 50
        
        titleWord.text = "Palavra"
        titleWord.fontColor = .black
        titleWord.fontSize = 60
        
        
        if ((eventLabel.text! as NSString).length) > 14 && ((eventLabel.text! as NSString).length) < 30{
            if ((eventLabel.text! as NSString).length) < 25 {
                eventLabel.position = CGPoint(x: size.width/2 * 1.3, y: size.height/2.7)
            } else{
                eventLabel.position = CGPoint(x: size.width/2 * 1.3, y: size.height/2.8)
            }
            eventLabel.lineBreakMode = .byCharWrapping
            eventLabel.numberOfLines = 0
            eventLabel.preferredMaxLayoutWidth = 275
            eventLabel.fontSize = 45
        } else if ((eventLabel.text! as NSString).length) >= 30 && ((eventLabel.text! as NSString).length) < 40{
            eventLabel.position = CGPoint(x: size.width/2 * 1.3, y: size.height/2.7)
            eventLabel.lineBreakMode = .byCharWrapping
            eventLabel.numberOfLines = 0
            eventLabel.preferredMaxLayoutWidth = 400 //300
            eventLabel.fontSize = 40
        }else if ((eventLabel.text! as NSString).length) >= 40 {
            eventLabel.position = CGPoint(x: size.width/2 * 1.3, y: size.height/2.6)
            eventLabel.lineBreakMode = .byCharWrapping
            eventLabel.numberOfLines = 0
            eventLabel.preferredMaxLayoutWidth = 400
            eventLabel.fontSize = 35
            baloonEvent.size = CGSize(width: 450, height: 280)
        }
        
        backgroundImage = SKSpriteNode(imageNamed: "fundoSorteio")
        backgroundImage?.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundImage?.zPosition = -1
        backgroundImage?.size = size
        
        if eventDisplay.isEmpty{
            
            titleWord.position = CGPoint(x: size.width/2 * 1.47, y: size.height*0.63)
            
            wordLabel.fontSize = 50
            wordLabel.position = CGPoint(x: size.width/2 * 1.47, y: size.height*0.55)
            
            npcAngel.position = CGPoint(x: size.width/2 * 1.82, y: size.height/3.7)
            npcAngel.size = CGSize(width: 200, height: 450)
            
            baloonWord.position = wordLabel.position
            baloonWord.zPosition = 0
            baloonWord.size = CGSize(width: 400, height: 350)
            
            if ((wordLabel.text! as NSString).length) >= 12 {
                baloonWord.size = CGSize(width: 450, height: 350)
            }
            
            addChild(npcAngel)
            addChild(baloonWord)
            
        } else {
            npcAngel.position = CGPoint(x: size.width/2 * 1.85, y: size.height/3)
            npcAngel.size = CGSize(width: 200, height: 400)
            npcDevil.position = CGPoint(x: size.width/2 * 1.65, y: size.height/5)
            npcDevil.size = CGSize(width: 200, height: 400)

            baloonEvent.position = CGPoint(x: size.width/2 * 1.3, y: size.height/2.3)
            baloonEvent.zPosition = 0
           
            titleWord.position = CGPoint(x: size.width/2 * 1.6, y: size.height/1.5)
            titleWord.fontSize = 50
            
            titleEvent.fontSize = 55
            
            wordLabel.fontSize = 50
            wordLabel.position = CGPoint(x: size.width/2 * 1.6, y: size.height/1.6)

            baloonWord.position = wordLabel.position
            baloonWord.zPosition = 0
            baloonWord.size = CGSize(width: 300, height: 250)

            addChild(npcAngel)
            addChild(npcDevil)
            addChild(baloonEvent)
            addChild(baloonWord)
//            addChild(titleEvent)
        }
        
        
        addChild(backgroundImage!)
        addChild(playerTimeSprite!)
        addChild(titleLabel)
        addChild(wordLabel)
        addChild(eventLabel)
//        addChild(titleWord)
        
    }
}
