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
    /// Background Sprite at Game Scene
    let backgroundSprite = SKSpriteNode(imageNamed: "tribunal")
    /// Pins Sprites at Game Scene
    var pinsSprite = [SKSpriteNode]()
    /// Lifes Sprites at Game Scene
    var lifeTeamSprite = [SKSpriteNode]()
    /// Judge Sprite at Game Scene
    var judgeSprite = SKSpriteNode(imageNamed: "judge")
    /// NPC Pins Sprites at Game Scene
    var pinsNPCSprite = [SKSpriteNode]()
    
    /// Word Label at Game Scene
    var wordLabel = SKLabelNode(fontNamed: "Chalkduster")
    /// Timer Label at Game Scene
    var timerLabel = SKLabelNode(fontNamed: "Chalkduster")
    /// Round Label at Game Scene
    var roundLabel = SKLabelNode(fontNamed: "Chalkduster")
    /// Event Label at Game Scene
    var eventLabel = SKLabelNode(fontNamed: "Chalkduster")
    
    /// Array of Images to Sprites
    var imagesSprite: [String] = ["pin1", "pin2", "pin1", "pin2", "pin1", "pin2"]
    
    /// User Defaults
    let defaults = UserDefaults.standard
    
    /// Array with two teams
    var team = [Team]()
    /// Timer
    weak var timer: Timer?
    /// Seconds at the timer
    var time: Int = 30
    
    /// Number of Turns
    static var turn: Int = 0
    /// Number of Rounds
    static var round: Int = 0
    
    /**
     Init Scene if there is not a event to the current player
    */
    init(size: CGSize, word: String, team1: Team, team2: Team, judge: Judge, players: [Person]) {
        super.init(size: size)
        
        let numberOfPlayers = players.count
        
        // add teams to the array
        team.append(team1)
        team.append(team2)
        
        // setups
        setupLifes(team: team)
        addTurn(numberOfPlayers: numberOfPlayers)
        setupLabel(word: word, event: nil)
        setupSprites(numberOfPlayers: numberOfPlayers, judge: judge, players: players)
        startTimer()
    }
    
    /**
     Init Scene if there is a event to the current player
     */
    init(size: CGSize, word: String, event: Event, team1: Team, team2: Team, judge: Judge, players: [Person]){
        super.init(size: size)
        
        let numberOfPlayers = players.count
        
        // add teams to array
        team.append(team1)
        team.append(team2)
        
        // setups
        setupLifes(team: team)
        addTurn(numberOfPlayers: numberOfPlayers)
        setupLabel(word: word, event: event.descriptionEvent)
        setupSprites(numberOfPlayers: numberOfPlayers, judge: judge, players: players)
        startTimer()
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Add a turn to the game and calculate Round
     */
    func addTurn(numberOfPlayers: Int){
        GameScene.turn += 1
        GameScene.round = (GameScene.turn / (numberOfPlayers - 1)) + 1
    }
    
    /**
     Setup word, timer, round and event labels in Nodes
     */
    func setupLabel(word: String, event: String?){
        // set time to timer
        if(GameScene.turn == 1){
            time = 60
        } else {
            time = 30
        }
        
        // set word label
        wordLabel.text = word
        wordLabel.fontSize = 30
        wordLabel.fontColor = .black
        wordLabel.position = CGPoint(x: size.width/2, y: size.height/2 + 15)
        
        // set timer label
        timerLabel.text = "\(time)"
        timerLabel.fontSize = 30
        timerLabel.fontColor = .black
        timerLabel.position = CGPoint(x: size.width/2, y: size.height/2 - 15)
        
        // set round label
        roundLabel.text = "\(GameScene.round)"
        roundLabel.fontSize = 30
        roundLabel.fontColor = .black
        roundLabel.position = CGPoint(x: size.width/2, y: size.height - 30)
        
        // set event if player had it
        if let eventString = event{
            eventLabel.text = eventString
            eventLabel.fontSize = 30
            eventLabel.fontColor = .black
            eventLabel.position = CGPoint(x: size.width/2, y: 40)
            addChild(eventLabel)
        }
        
        // add label to the scene
        addChild(wordLabel)
        addChild(timerLabel)
        addChild(roundLabel)
    }
    
    /**
     Setup sprites of background, pins in game and npc pins in Nodes
     */
    func setupSprites(numberOfPlayers: Int, judge: Judge, players: [Person]){
        // Background Sprite
        backgroundSprite.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundSprite.zPosition = -1.0
        
        // Judge Sprite
        judgeSprite.position = CGPoint(x: size.width/2, y: size.height * CGFloat(0.8))
        
        // Player Pin Sprite
        for i in 0...numberOfPlayers - 2{
            pinsSprite.append(SKSpriteNode(imageNamed: imagesSprite[i])) // temporario!!!!!
//            pinsSprite.append(SKSpriteNode(imageNamed: "pin_\(players[i].color)"))
        }
        
        // set player position in base of how many players have
        switch numberOfPlayers {
        case 2:
            pinsSprite[0].position = CGPoint(x: size.width, y: size.height/4)
            pinsSprite[1].position = CGPoint(x: size.width/4, y: size.height/4)
            break
        case 4:
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
        
        // NPC Pin Sprite
        for _ in 0...1{
            pinsNPCSprite.append(SKSpriteNode(imageNamed: "pinA"))
        }
        
        // set NPC Pin position
        pinsNPCSprite[0].position = CGPoint(x: size.width * CGFloat(0.2), y: size.height * CGFloat(0.5))
        pinsNPCSprite[1].position = CGPoint(x: size.width * CGFloat(0.8), y: size.height * CGFloat(0.5))
        
        // add Child
        addChild(judgeSprite)
        addChild(backgroundSprite)
        for i in 0...numberOfPlayers - 2{
            addChild(pinsSprite[i])
        }
        for i in 0...pinsNPCSprite.count - 1{
            addChild(pinsNPCSprite[i])
        }
    }
    
    /**
     Setup lifes sprites by team number of lifes in Nodes
     */
    func setupLifes(team: [Team]){
        // set number of hearts of each team
        for i in 0...1{
            switch team[i].lifes {
            case 3:
                lifeTeamSprite.append(SKSpriteNode(imageNamed: "heart"))
                break
            case 2:
                lifeTeamSprite.append(SKSpriteNode(imageNamed: "heart"))
                break
            case 1:
                lifeTeamSprite.append(SKSpriteNode(imageNamed: "heart"))
                break
            default:
                lifeTeamSprite.append(SKSpriteNode(imageNamed: "heart"))
            }
        }
        
        // set life position of each team
        lifeTeamSprite[0].position = CGPoint(x: size.width * CGFloat(0.25), y: size.height * CGFloat(0.75))
        lifeTeamSprite[1].position = CGPoint(x: size.width * CGFloat(0.75), y: size.height * CGFloat(0.75))
        
        // add to the scene
        addChild(lifeTeamSprite[0])
        addChild(lifeTeamSprite[1])
    }
    
    /**
     Start timer for player speak
     */
    func startTimer(){
        // start timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerDecrease), userInfo: nil, repeats: true)
    }
    
    /**
     Function to decrease time to the label timer
     */
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
