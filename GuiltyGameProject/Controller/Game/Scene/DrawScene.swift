//
//  DrawScene.swift
//  GuiltyGameProject
//
//  Created by Ferraz on 28/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import SpriteKit

protocol randomDelegate{
    func sendRandom(one: Int,two: Int)
}

class DrawScene: SKScene{
    
    var randomDelegate : randomDelegate?
    
    var diceTeam1 = SKSpriteNode()
    var diceTeam2 = SKSpriteNode()
    
    var diceRotate: [SKTexture] = []
    var rotateFrame: [SKTexture] = []
    var numPlayers = 0
    var randomLabel = SKLabelNode()
    
    var firstFrameTextureDice1 = SKTexture()
    var firstFrameTextureDice2 = SKTexture()
    
    var arrayDiceImage: [String] = ["Dice1","Dice2","Dice3","Dice4","Dice5","Dice6"]
    
    var backgroundImage = SKSpriteNode()
    
    var aux = false
    
    init(size: CGSize,players: [Person] ) {
        super.init(size: size)
        numPlayers = players.count
        
        if NSLocalizedString("startText", comment: "") == "Start" {
            randomLabel.text = "The event will be held by..."
        }else{
            randomLabel.text = "O evento será realizado por..."
        }
        
        randomLabel.fontName = "MyriadPro-Regular"
        randomLabel.fontSize = 60
        randomLabel.position = CGPoint(x: size.width/2, y: size.height/8)
        self.addChild(randomLabel)
        
        
        backgroundImage = SKSpriteNode(imageNamed: "fundoSorteio")
        backgroundImage.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundImage.zPosition = -1
        backgroundImage.size = size
        
        self.addChild(backgroundImage)
    }
    
    func drawDice(){
        drawDice(players: numPlayers)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawDice(players: Int){
        
        
        var numberOne = UInt32(2)
        var numbertwo = UInt32(2)
        
        if players == 2{
            numberOne = arc4random_uniform(UInt32(2)) + 1
            numbertwo = numberOne
            //+1
            print("VALUE = \(numberOne)")
        }
        
        if players == 4{
            numberOne = arc4random_uniform(UInt32(2)) + 1
            numbertwo = arc4random_uniform(UInt32(2)) + 3
        }
        
        if players == 6{
            numberOne = arc4random_uniform(UInt32(3)) + 1
            numbertwo = arc4random_uniform(UInt32(3)) + 4
        }

        randomDelegate?.sendRandom(one : Int(numberOne),two: Int(numbertwo))
        
        
        self.diceTeam1.position = CGPoint(x: size.width/2, y: size.height/2 - 50)
        self.diceTeam1.size = CGSize(width: 500, height: 500)
        self.diceTeam2.position = CGPoint(x: size.width/2, y: size.height/2 + 100)
        self.diceTeam2.size = CGSize(width: 500, height: 500)
        
        
        let diceAnimateAtlas = SKTextureAtlas(named: "Dices")
        
        
        let numImages = diceAnimateAtlas.textureNames.count
        
        if players == 2 {
            self.diceTeam2.isHidden = true
            for i in 1...2 {
                let diceTextureName = "Dice\(i)"
                rotateFrame.append(diceAnimateAtlas.textureNamed(diceTextureName))
                print(i)
            }
            print("...\(numberOne)")
        } else if players == 4{
            for i in 1...numImages - 2 {
                let diceTextureName = "Dice\(i)"
                rotateFrame.append(diceAnimateAtlas.textureNamed(diceTextureName))
                
            }
            

        } else {            
            for i in 1...numImages {
                
                let diceTextureName = "Dice\(i)"
                rotateFrame.append(diceAnimateAtlas.textureNamed(diceTextureName))
                
            }
        }
        
        
        
        if players != 2 {
            self.diceRotate = rotateFrame
            firstFrameTextureDice1 = diceRotate[Int(numberOne) - 1]
            firstFrameTextureDice2 = diceRotate[Int(numbertwo) - 1]
               
               
            self.diceTeam1 = SKSpriteNode(texture: firstFrameTextureDice1)
            self.diceTeam2 = SKSpriteNode(texture: firstFrameTextureDice2)
            diceTeam1.position.x = size.width/2 + 200
            diceTeam1.position.y = size.height/2
            diceTeam1.size = CGSize(width: 300, height: 300)

            diceTeam2.position.x = size.width/2 - 200
            diceTeam2.position.y = size.height/2
            diceTeam2.size = CGSize(width: 300, height: 300)
            
            
            addChild(diceTeam1)
            addChild(diceTeam2)
            animateDice()
        } else {
            self.diceRotate = rotateFrame
            firstFrameTextureDice1 = diceRotate[Int(numberOne) - 1]
            firstFrameTextureDice2 = diceRotate[Int(1)]
            
            self.diceTeam1 = SKSpriteNode(texture: firstFrameTextureDice1)
            
            
                addChild(diceTeam1)
                animateDice2Players([diceTeam1])
            
            
            
            
//            self.diceRotate = rotateFrame
//
//            firstFrameTextureDice1 = diceRotate[Int(0)]
//            firstFrameTextureDice2 = diceRotate[Int(1)]
//            print("....\(numberOne)")
//
//            self.diceTeam2 = SKSpriteNode(texture: firstFrameTextureDice2)
//            self.diceTeam1 = SKSpriteNode(texture: firstFrameTextureDice1)
//
//            if aux {
//                self.diceTeam1 = SKSpriteNode(texture: firstFrameTextureDice1)
//                aux = false
//                addChild(diceTeam1)
//                numbertwo = 0
//                animateNode([diceTeam2])
//                animateDice()
//            } else {
//                self.diceTeam2 = SKSpriteNode(texture: firstFrameTextureDice2)
//                aux = true
//                addChild(diceTeam2)
//                numbertwo = 2
//                animateNode([diceTeam1])
//                animateDice()
//            }
//
            diceTeam1.position.x = size.width/2
            diceTeam1.position.y = size.height/2
            self.diceTeam1.size = CGSize(width: 500, height: 500)
//            diceTeam2.position = diceTeam1.position
//            diceTeam2.size = diceTeam1.size
        }
//        print("1 -> \(numberOne) 2-> \(numbertwo)" )
//
//
//
//
//                addChild(diceTeam1)
//                addChild(diceTeam2)
//        animateDice()
        //        animateNode(diceTeam1.children)
        //        animateNode(diceTeam2.children)
        
    }
    
    var i = 0
    
    func animateNode(_ nodes: [SKSpriteNode]){
        
        for nodePassed in nodes {
            i = Int.random(in: 0...1)
            
            let delayAction = SKAction.wait(forDuration: TimeInterval(1) * 0.2)
            
            let scaleUpAction = SKAction.scale(to: 1.5, duration: 0.7) //0.3
            let scaleDownAction = SKAction.scale(to: 1, duration: 0.8) //0.3
            
            let waitAction = SKAction.wait(forDuration: 0.5) //2
            
            let scaleActionSequence = SKAction.sequence([scaleUpAction, scaleDownAction, waitAction])
            rotateFrame.shuffle()
            
            if i == 0{
                rotateFrame[rotateFrame.count - 1] = firstFrameTextureDice2
                i = 1
            } else{
                rotateFrame[rotateFrame.count - 1] = firstFrameTextureDice1
                i = 0
            }
     
            let animateTexture = SKAction.animate(with: rotateFrame, timePerFrame: 0.3)
            
            
            let rotateAction = SKAction.rotate(byAngle: .pi * 2, duration: 1.5)
            
            let actionSequence = SKAction.group([delayAction,scaleActionSequence,animateTexture, rotateAction])
            
            nodePassed.run(actionSequence)
        }
        
        
    }
    
    func animateDice(){
        if numPlayers == 2{
            if aux{
                animateNode([self.diceTeam2, self.diceTeam1])
            } else {
                animateNode([self.diceTeam1, self.diceTeam2])
            }
        } else {
            animateNode([self.diceTeam1,self.diceTeam2])
        }
    }
    
    func animateDice2Players(_ nodes: [SKSpriteNode]){
        
        for (_ ,node) in nodes.enumerated() {
            // Offset each node with a slight delay depending on the index
            let delayAction = SKAction.wait(forDuration: TimeInterval(1) * 0.2)

            // Scale up and then back down
            let scaleUpAction = SKAction.scale(to: 1.5, duration: 0.7)
            let scaleDownAction = SKAction.scale(to: 1, duration: 0.8)

            // Wait for 2 seconds before repeating the action
            let waitAction = SKAction.wait(forDuration: 0.5)

            // Form a sequence with the scale actions, as well as the wait action
            let scaleActionSequence = SKAction.sequence([scaleUpAction, scaleDownAction, waitAction])
            rotateFrame.shuffle()
            
            let aux1 = [firstFrameTextureDice1,firstFrameTextureDice2]
            
            if aux {
                rotateFrame[rotateFrame.count - 1] = aux1[0]
                aux = false
            }else{
                rotateFrame[rotateFrame.count - 1] = aux1[1]
                aux = true
            }
            
            
            let animateTexture = SKAction.animate(withNormalTextures: rotateFrame, timePerFrame: 0.3)
            
            let rotateAction =  SKAction.rotate(byAngle: .pi * 2, duration: 1.5)
            
            // Combine the delay and the repeat actions into another sequence
            let actionSequence = SKAction.group([delayAction,scaleActionSequence,animateTexture,rotateAction])

            // Run the action
            node.run(actionSequence)
        }
    }
}
