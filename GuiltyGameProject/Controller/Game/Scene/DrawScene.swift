//
//  DrawScene.swift
//  GuiltyGameProject
//
//  Created by Ferraz on 28/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import SpriteKit

class DrawScene: SKScene{
    
    var diceTeam1 = SKSpriteNode()
    var diceTeam2 = SKSpriteNode()
    
    var diceRotate: [SKTexture] = []
    
    var arrayDiceImage: [String] = ["Dice1","Dice2","Dice3","Dice4","Dice5","Dice6"]
    
    
    init(team1: Team, team2: Team, players: [Person]){
        super.init()
        
        let numPlayers = players.count
        
        drawDice(players: numPlayers)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawDice(players: Int){
        
        
        let numberOne = arc4random_uniform(UInt32(players)) + 1
        let numbertwo = arc4random_uniform(UInt32(players)) + 1
        
//        let diceTeam1 = SKSpriteNode(imageNamed: "Dice\(numberOne)")
//        let diceTeam2 = SKSpriteNode(imageNamed: "Dice\(numbertwo)")
        
        
        self.diceTeam1.position = CGPoint(x: size.width/2, y: size.height/2 - 50)
        self.diceTeam1.size = CGSize(width: 300, height: 200)
        
        self.diceTeam2.position = CGPoint(x: size.width/2, y: size.height/2 + 50)
        self.diceTeam2.size = CGSize(width: 300, height: 300)
        
        
        let diceAnimateAtlas = SKTextureAtlas(named: "DiceImages")
        var rotateFrame: [SKTexture] = []
        
        let numImages = diceAnimateAtlas.textureNames.count
        
        if players == 3 {
            for i in 1...numImages - 3 {
                let diceTextureName = "Dice\(i)"
                rotateFrame.append(diceAnimateAtlas.textureNamed(diceTextureName))
                
            }
        } else if players == 5{
            for i in 1...numImages - 1 {
                let diceTextureName = "Dice\(i)"
                rotateFrame.append(diceAnimateAtlas.textureNamed(diceTextureName))
                
            }
        } else {
            for i in 1...numImages {
                let diceTextureName = "Dice\(i)"
                rotateFrame.append(diceAnimateAtlas.textureNamed(diceTextureName))
                
            }
        }
        
        self.diceRotate = rotateFrame
        
        let firstFrameTextureDice1 = diceRotate[Int(numberOne)]
        let firstFrameTextureDice2 = diceRotate[Int(numbertwo)]
        self.diceTeam1 = SKSpriteNode(texture: firstFrameTextureDice1)
        self.diceTeam2 = SKSpriteNode(texture: firstFrameTextureDice2)
        addChild(diceTeam1)
        addChild(diceTeam2)
        animateDice()

        

//        addChild(diceTeam1)
//        addChild(diceTeam2)
//
//        animateNode(diceTeam1.children)
//        animateNode(diceTeam2.children)
        
    }
    
    func animateNode(_ nodes: [SKNode]){
        for(index,node) in nodes.enumerated() {
            
            
            let delayAction = SKAction.wait(forDuration: TimeInterval(index) * 0.2)
            
            let scaleUpAction = SKAction.scale(to: 1.5, duration: 0.3)
            let scaleDownAction = SKAction.scale(to: 1, duration: 0.3)
            
            let waitAction = SKAction.wait(forDuration: 2)
            
            let scaleActionSequence = SKAction.sequence([scaleUpAction, scaleDownAction, waitAction])
            
            let repeatAction = SKAction.repeatForever(scaleActionSequence)
            
            let rotateAction = SKAction.rotate(byAngle: .pi * 2, duration: 0.6)
            
            let actionSequence = SKAction.sequence([delayAction,repeatAction, rotateAction])
    
            node.run(actionSequence)
            
        }

    }
    
    func animateDice(){
        animateNode(self.diceTeam1.children)
        animateNode(self.diceTeam2.children)
    }
}
