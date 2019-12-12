//
//  GameScene.swift
//  GuiltyGameProject
//
//  Created by Ferraz on 26/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import SpriteKit


protocol sendTimerDelegate{
    func timeIsOver()
}

class GameScene: SKScene{
    
    var delegateSend: sendTimerDelegate?
    var actions = Actions()
    var firstSelectedEvent : Int?
    var secondSelectedEvent : Int?
    /// Background Sprite at Game Scene
    let backgroundLayerSprite = SKSpriteNode(imageNamed: "fundoTribunal")
    let backgroundSprite = SKSpriteNode(imageNamed: "tribunal")
    /// Pins Sprites at Game Scene
    var pinsSprite = [SKSpriteNode]()
    /// Lifes Sprites at Game Scene
    var lifeTeamSprite = [SKSpriteNode]()
    /// Judge Sprite at Game Scene
    var judgeSprite = SKSpriteNode(imageNamed: "judge\(UserDefaults.standard.integer(forKey: "positionCollection"))")
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
    
    var balaoAnjo = SKSpriteNode(imageNamed: "balaoAnjo")
    var balaoCapeta = SKSpriteNode(imageNamed: "balaoCapeta")
    
    var balaoComentario = SKLabelNode(fontNamed: "Chalkduster")
    var balaoComentario2 = SKLabelNode(fontNamed: "Chalkduster")
    
    /// Array of Images to Sprites
    var imagesSprite: [String] = ["pinBlue", "pinGreen", "pinOrange", "pinPink", "pinBlack", "pinYellow"]
    
    /// User Defaults
    let defaults = UserDefaults.standard
    
    /// Array with two teams
    var team = [Team]()
    /// Timer
    weak var timer: Timer?
    /// Seconds at the timer
    var time: Int = 30
    
    /// Number of Turns
    static var turn: Int = -1
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
        addTurn(numberOfPlayers: numberOfPlayers)
        setupLifes(team: team)

        setupLabel(word: word, event: nil)

        setupSprites(numberOfPlayers: numberOfPlayers, judge: judge, players: players)
        startTimer()
    }
    
    /**
     Init Scene if there is a event to the current player
     */

    init(size: CGSize, word: String, event: String, team1: Team, team2: Team, judge: Judge, players: [Person]){

        super.init(size: size)
        
        let numberOfPlayers = players.count
        
        // add teams to array
        team.append(team1)
        team.append(team2)
        
        // setups
        addTurn(numberOfPlayers: numberOfPlayers)
        
        
        setupLabel(word: word, event: event)

        setupSprites(numberOfPlayers: numberOfPlayers, judge: judge, players: players)
        setupLifes(team: team)
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
        if(GameScene.turn < 1){
            timerLabel.alpha = 0
        } else if GameScene.turn == 1 {
            timerLabel.alpha = 1
            time = 60
        } else{
            time = 30
        }
        
        // set word label
        wordLabel.text = word
        wordLabel.fontSize = 40
        wordLabel.fontColor = .white
        wordLabel.position = CGPoint(x: size.width * CGFloat(0.9), y: size.height * CGFloat(0.9))
        
        
        // set timer label
        timerLabel.text = "\(time)"
        timerLabel.fontSize = 100
        timerLabel.fontColor = .white
        timerLabel.position = CGPoint(x: size.width/2, y: size.height/1.75)
        
        // set round label
        roundLabel.text = "\(GameScene.round)"
        roundLabel.fontSize = 30
        roundLabel.fontColor = .white
        roundLabel.position = CGPoint(x: size.width/2, y: size.height - 30)
        
        // set event if player had it
        if let eventString = event{
            eventLabel.text = eventString
            eventLabel.fontSize = 50
            eventLabel.fontColor = .white
            eventLabel.position = CGPoint(x: size.width/2, y: 40)
            eventLabel.position = CGPoint(x: size.width * CGFloat(0.8), y: size.height * CGFloat(0.85))
            addChild(eventLabel)
        }
        
        // add label to the scene
        addChild(wordLabel)
        addChild(timerLabel)
     //   addChild(roundLabel)
    }
    
    /**
     Setup sprites of background, pins in game and npc pins in Nodes
     */
    func setupSprites(numberOfPlayers: Int, judge: Judge, players: [Person]){
        // Background Sprite
        backgroundSprite.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundSprite.size = size
        backgroundSprite.alpha = 1
        backgroundSprite.zPosition = -1.0
        
        backgroundLayerSprite.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundLayerSprite.size = size
        backgroundLayerSprite.alpha = 1
        backgroundLayerSprite.zPosition = -2.0
        
        balaoAnjo.position = CGPoint(x: size.width * 0.80, y: size.height*0.62)
        balaoCapeta.position = CGPoint(x: size.width * 0.21, y: size.height*0.64)
        
        balaoComentario.position = balaoAnjo.position
        balaoComentario.fontColor = .black
        balaoComentario.fontSize -= 10
        balaoComentario.zPosition += 1
        balaoComentario.text = "Perdeu mano"
        
        balaoComentario2.position = balaoCapeta.position
        balaoComentario2.fontColor = .white
        balaoComentario2.fontSize -= 10
        balaoComentario2.zPosition += 1
        balaoComentario2.text = "Perdeu vidinha"
        
        balaoAnjo.alpha = 0
        balaoCapeta.alpha = 0
        balaoComentario.alpha = 0
        balaoComentario2.alpha = 0
        
        // Judge Sprite
        judgeSprite.position = CGPoint(x: size.width/2, y: size.height * 0.77)
        judgeSprite.zPosition -= 1
        
        // Player Pin Sprite
        for i in 0...numberOfPlayers - 1{
            pinsSprite.append(SKSpriteNode(imageNamed: imagesSprite[i])) // temporario!!!!!
       //     pinsSprite[i].setScale(0.7)
//            pinsSprite.append(SKSpriteNode(imageNamed: "pin_\(players[i].color)"))
        }
        
        // set player position in base of how many players have
        switch numberOfPlayers {
        case 2:
            pinsSprite[0].position = CGPoint(x: size.width*0.385, y: size.height/4)
            pinsSprite[1].position = CGPoint(x: size.width*0.61, y: size.height/4)
            break
        case 4:
            pinsSprite[0].position = CGPoint(x: size.width*0.31, y: size.height/4)
            pinsSprite[1].position = CGPoint(x: size.width*0.385, y: size.height/4)
            pinsSprite[2].position = CGPoint(x: size.width*0.61, y: size.height/4)
            pinsSprite[3].position = CGPoint(x: size.width*0.69, y: size.height/4)
            break
        default:
            pinsSprite[0].position = CGPoint(x: size.width*0.235, y: size.height/3.6)
            pinsSprite[1].position = CGPoint(x: size.width*0.31, y: size.height/3.6)
            pinsSprite[2].position = CGPoint(x: size.width*0.385, y: size.height/3.6)
            pinsSprite[3].position = CGPoint(x: size.width*0.61, y: size.height/3.6)
            pinsSprite[4].position = CGPoint(x: size.width*0.69, y: size.height/3.6)
            pinsSprite[5].position = CGPoint(x: size.width*0.77, y: size.height/3.6)
        }
        
        // NPC Pin Sprite
        for _ in 0...1{
            pinsNPCSprite.append(SKSpriteNode(imageNamed: "pinA"))
        }
        
        // set NPC Pin position
        pinsNPCSprite[0].position = CGPoint(x: size.width * CGFloat(0.2), y: size.height * CGFloat(0.5))
        pinsNPCSprite[1].position = CGPoint(x: size.width * CGFloat(0.8), y: size.height * CGFloat(0.5))
        
  
        
        // add Child
        addChild(balaoComentario)
        addChild(balaoComentario2)
        addChild(judgeSprite)
        addChild(backgroundSprite)
        addChild(backgroundLayerSprite)
        addChild(balaoAnjo)
        addChild(balaoCapeta)
        for i in 0...numberOfPlayers - 1{
            addChild(pinsSprite[i])
        }
        for i in 0...pinsNPCSprite.count - 1{
         //   addChild(pinsNPCSprite[i])
        }
    }
    
    func movePlayer(playerNumber : Int){
        
        print(playerNumber)
        actions.movePOINT(pinsSprite[playerNumber], point: CGPoint(x: size.width/2, y: size.height*0.4), interval: 2)        
    }
    
    var flag = UserDefaults.standard.bool(forKey: "flag")
    var flag2 = UserDefaults.standard.bool(forKey: "flag2")
    
    /**
     Setup lifes sprites by team number of lifes in Nodes
     */
    func setupLifes(team: [Team]){
        // set number of hearts of each team
        for i in 0...1{
            
            switch team[i].lifes {
            case 3:
                lifeTeamSprite.append(SKSpriteNode(imageNamed: "heart3"))
                break
            case 2:
                lifeTeamSprite.append(SKSpriteNode(imageNamed: "heart2"))
                break
            case 1:
                lifeTeamSprite.append(SKSpriteNode(imageNamed: "heart1"))
                break
            default:
                lifeTeamSprite.append(SKSpriteNode(imageNamed: "heart3"))
            }
        }
        
        if team[0].lifes == 2 && flag{
            balaoComentario.alpha = 1
            balaoAnjo.alpha = 1
            UserDefaults.standard.set(false, forKey: "flag")
        }
        
        if team[1].lifes == 1 && flag2{
            balaoComentario2.alpha = 1
            balaoCapeta.alpha = 1
            UserDefaults.standard.set(false, forKey: "flag2")
        }
        
        
        // set life position of each team
        lifeTeamSprite[0].position = CGPoint(x: size.width * CGFloat(0.41), y: size.height * CGFloat(0.70))
        lifeTeamSprite[1].position = CGPoint(x: size.width * CGFloat(0.59), y: size.height * CGFloat(0.70))
        
        // add to the scene
        
        addChild(lifeTeamSprite[0])
        addChild(lifeTeamSprite[1])
        
    }
    
    
    func sendSortedEvent(_ first: Int, _ second: Int){
        firstSelectedEvent = first
        secondSelectedEvent = second
        
        if firstSelectedEvent != 9 && secondSelectedEvent != 9{
            pinsSprite[first - 1].run(SKAction.repeatForever(SKAction.sequence([SKAction.fadeIn(withDuration: 0.3),SKAction.fadeOut(withDuration: 0.3)])))
            pinsSprite[second - 1].run(SKAction.repeatForever(SKAction.sequence([SKAction.fadeIn(withDuration: 0.3),SKAction.fadeOut(withDuration: 0.3)])))
          }
          
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
        if time <= 0{
            delegateSend?.timeIsOver()
            timer?.invalidate()
        }
    }
    
    
    func endTimer(){
        // start timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerStop), userInfo: nil, repeats: false)
    }
    
    /**
     Function to decrease time to the label timer
     */
    @objc func timerStop(){
        time -= 0
        DispatchQueue.main.async {
            self.timerLabel.text = "\(self.time)"
        }
    }
    
   
}
