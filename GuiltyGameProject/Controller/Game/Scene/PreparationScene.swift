//
//  PreparationScene.swift
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 06/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import SpriteKit


class PreparationScene : SKScene{
    
    
    var backgroundImage = SKSpriteNode(imageNamed: "fundoSorteio")
    var choosePinos = SKLabelNode()
    var courtSession = SKLabelNode()
    var pinos = [SKSpriteNode]()
    var juiz = SKSpriteNode(imageNamed: "judge\(UserDefaults.standard.integer(forKey: "positionCollection"))")
    var qtdPinos =  UserDefaults.standard.integer(forKey: "numberOfPlayers")
    var colors: [String] = ["pinBlue", "pinGreen", "pinOrange", "pinPink", "pinBlack", "pinYellow"]
    var positions = [CGPoint(x: 0, y: 0)]
     
    func changeJuiz(){
        juiz = SKSpriteNode(imageNamed: "judge\(UserDefaults.standard.integer(forKey: "positionCollection"))")
    }
    
    override init(size: CGSize){
        super.init(size: size)
        
        courtSession.fontColor = .white
        courtSession.fontSize = 50
        courtSession.position = CGPoint(x: size.width/2, y: size.height/1.2)
        courtSession.zPosition = 2
        courtSession.text = NSLocalizedString("courtSession", comment: "")
        addChild(courtSession)
        
        choosePinos.fontColor = .white
        choosePinos.fontSize = 50
        choosePinos.position = CGPoint(x: size.width/2, y: size.height/2)
        choosePinos.zPosition = 2
        choosePinos.text = NSLocalizedString("choosePins", comment: "")
        addChild(choosePinos)
        
        juiz.position = CGPoint(x: size.width/2, y: size.height/1.5)
        self.addChild(juiz)
        
        backgroundImage.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundImage.zPosition = -1
        backgroundImage.size = size
        addChild(backgroundImage)
        
        switch(qtdPinos){
        case 2:
            var pino = SKSpriteNode(imageNamed: colors[0])
            pino.position = CGPoint(x: size.width*0.4, y: size.height*0.3)
            
            var pino2 = SKSpriteNode(imageNamed: colors[1])
            pino2.position = CGPoint(x: size.width*0.6, y: size.height*0.3)
            
            self.addChild(pino2)
            self.addChild(pino)
            
            
        case 4:
            var pino = SKSpriteNode(imageNamed: colors[0])
            pino.position = CGPoint(x: size.width*0.3, y: size.height*0.3)
            
            var pino2 = SKSpriteNode(imageNamed: colors[1])
            pino2.position = CGPoint(x: size.width*0.4, y: size.height*0.3)
            
            var pino3 = SKSpriteNode(imageNamed: colors[2])
            pino3.position = CGPoint(x: size.width*0.6, y: size.height*0.3)
                      
            var pino4 = SKSpriteNode(imageNamed: colors[3])
            pino4.position = CGPoint(x: size.width*0.7, y: size.height*0.3)
            
            self.addChild(pino4)
            self.addChild(pino3)
            self.addChild(pino2)
            self.addChild(pino)
            
        default:
            var pino = SKSpriteNode(imageNamed: colors[0])
            pino.position = CGPoint(x: size.width*0.2, y: size.height*0.3)
            
            var pino2 = SKSpriteNode(imageNamed: colors[1])
            pino2.position = CGPoint(x: size.width*0.3, y: size.height*0.3)
            
            var pino3 = SKSpriteNode(imageNamed: colors[2])
            pino3.position = CGPoint(x: size.width*0.4, y: size.height*0.3)
            
            var pino4 = SKSpriteNode(imageNamed: colors[3])
            pino4.position = CGPoint(x: size.width*0.6, y: size.height*0.3)
            
            var pino5 = SKSpriteNode(imageNamed: colors[4])
            pino5.position = CGPoint(x: size.width*0.7, y: size.height*0.3)
            
            
            var pino6 = SKSpriteNode(imageNamed: colors[5])
            pino6.position = CGPoint(x: size.width*0.8, y: size.height*0.3)
            
            
            self.addChild(pino6)
            self.addChild(pino5)
            self.addChild(pino4)
            self.addChild(pino3)
            self.addChild(pino2)
            self.addChild(pino)
            
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
