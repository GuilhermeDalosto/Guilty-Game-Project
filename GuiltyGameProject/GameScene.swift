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
    let backgroundSprite = SKSpriteNode(imageNamed: "2")
        var pinsSprite = [SKSpriteNode]()
    //    let eventSprite = SKSpriteNode(imageNamed: "2")
        
        var wordLabel = SKLabelNode(fontNamed: "Chalkduster")
        var timerLabel = SKLabelNode(fontNamed: "Chalkduster")
        var roundLabel = SKLabelNode(fontNamed: "Chalkduster")
        var eventLabel = SKLabelNode(fontNamed: "Chalkduster")
        
        var imagesSprite: [String] = ["1", "1", "1", "1", "1", "1"]
        
        let defaults = UserDefaults.standard
        
        weak var timer: Timer?
        var time: Int = 30
        
        static var turn: Int = 0
        static var round: Int = 0
        
        init(size: CGSize, word: String) {
            super.init(size: size)
    //        let numberOfPlayers: Int = defaults.integer(forKey: "NumberOfPlayers")
            let numberOfPlayers: Int = 3
            
            addTurn(numberOfPlayers: numberOfPlayers)
            setupLabel(word: word, event: nil)
            setupSprites(numberOfPlayers: numberOfPlayers)
            startTimer()
        }
        
        init(size: CGSize, word: String, event: String){
            super.init(size: size)
    //        let numberOfPlayers: Int = defaults.integer(forKey: "NumberOfPlayers")
            let numberOfPlayers: Int = 3
            
            addTurn(numberOfPlayers: numberOfPlayers)
            setupLabel(word: word, event: event)
            setupSprites(numberOfPlayers: numberOfPlayers)
            startTimer()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func addTurn(numberOfPlayers: Int){
            GameScene.turn += 1
            GameScene.round = (GameScene.turn / (numberOfPlayers - 1)) + 1
        }
        
        func setupLabel(word: String, event: String?){
            if(GameScene.turn == 1){
                time = 60
            } else {
                time = 30
            }
            
            wordLabel.text = word
            wordLabel.fontSize = 30
            wordLabel.fontColor = .black
            wordLabel.position = CGPoint(x: size.width/2, y: size.height/2 + 15)
            
            timerLabel.text = "\(time)"
            timerLabel.fontSize = 30
            timerLabel.fontColor = .black
            timerLabel.position = CGPoint(x: size.width/2, y: size.height/2 - 15)
            
            roundLabel.text = "\(GameScene.round)"
            roundLabel.fontSize = 30
            roundLabel.fontColor = .black
            roundLabel.position = CGPoint(x: size.width/2, y: size.height - 30)
            
            if let eventString = event{
                eventLabel.text = eventString
                eventLabel.fontSize = 30
                eventLabel.fontColor = .black
                eventLabel.position = CGPoint(x: size.width/2, y: 40)
                addChild(eventLabel)
            }
            
            addChild(wordLabel)
            addChild(timerLabel)
            addChild(roundLabel)
        }
        
        func setupSprites(numberOfPlayers: Int){
            backgroundSprite.position = CGPoint(x: size.width/2, y: size.height/2)
            backgroundSprite.zPosition = -1.0
    //        eventSprite.position = CGPoint(x: size.width/2, y: 0)
            
            for i in 0...numberOfPlayers - 2{
    //            pinsSprite[i] = SKSpriteNode(imageNamed: imagesSprite[i])
                pinsSprite.append(SKSpriteNode(imageNamed: imagesSprite[i]))
            }
            
            switch numberOfPlayers {
            case 3:
                pinsSprite[0].position = CGPoint(x: size.width, y: size.height/4)
                pinsSprite[1].position = CGPoint(x: size.width/4, y: size.height/4)
                break
            case 5:
                pinsSprite[0].position = CGPoint(x: 0, y: size.height/4)
                pinsSprite[1].position = CGPoint(x: 0, y: size.height/4)
                pinsSprite[2].position = CGPoint(x: 0, y: size.height/4)
                pinsSprite[3].position = CGPoint(x: 0, y: size.height/4)
                break
            default:
                pinsSprite[0].position = CGPoint(x: 0, y: size.height/4)
                pinsSprite[1].position = CGPoint(x: 0, y: size.height/4)
                pinsSprite[2].position = CGPoint(x: 0, y: size.height/4)
                pinsSprite[3].position = CGPoint(x: 0, y: size.height/4)
                pinsSprite[4].position = CGPoint(x: 0, y: size.height/4)
                pinsSprite[5].position = CGPoint(x: 0, y: size.height/4)
            }
            
            addChild(backgroundSprite)
    //        addChild(eventSprite)
            for i in 0...numberOfPlayers - 2{
                addChild(pinsSprite[i])
            }
        }
        
        func startTimer(){
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerDecrease), userInfo: nil, repeats: true)
        }
        
        @objc func timerDecrease(){
            time -= 1
            DispatchQueue.main.async {
                self.timerLabel.text = "\(self.time)"
            }
            if time == 0{
                timer?.invalidate()
            }
        }
}
