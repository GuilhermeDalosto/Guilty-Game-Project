//
//  GameViewController.swift
//  GuiltyGameProject
//
//  Created by Ferraz on 26/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

protocol StatisticsProtocol: NSObject{
//    var playersInfo: [StatisticsInfo] { get set }
    func sendPlayersInfo(playersInfo: [StatisticsInfo])
}

class GameViewController: UIViewController, sendTimerDelegate, randomDelegate{
    // secondViewController
    var playersInfo: [StatisticsInfo] = []
    
    func sendRandom(one: Int, two: Int) {
        firstSortedForEvent = one
        secondSortedForEvent = two
    }
    
    
    func timeIsOver() {
        print("tempo acabou")
        //changeScene()
    }
    
    @IBOutlet weak var gameView: SKView!
    @IBOutlet weak var pauseView: SKView!
    @IBOutlet weak var quitGameView: SKView!
    
    
    let music = Sound()
    var firstSortedForEvent = 9
    var secondSortedForEvent = 9
    var difficulty = UserDefaults.standard.integer(forKey: "difficulty")
    
    // scenes
    /// scene to draw a event to one player for each team
    var drawScene: DrawScene? = nil
    /// scene to say which player will play
    var turnScene: TurnScene? = nil
    /// scene with theme to start the game
    var themeScene: ThemeScene? = nil
    /// main scene of the game
    var gameScene: GameScene? = nil
    /// scene of pause
    var pauseScene: PauseScene? = nil
    /// scene of quit game
    var quitGameScene: QuitGameScene? = nil
    
    
    // characters of the game (without judge)
    /// 2 teams that is in the game
    var team = [Team]()
    /// array with all players(excluding the judge)
    var players = [Person]()
    /// player of the turn
    var playerTurn = Person()
    /// array of players colors
    var colors = [NSLocalizedString("blue", comment: ""),NSLocalizedString("green", comment: ""),NSLocalizedString("orange", comment: ""),NSLocalizedString("pink", comment: ""),NSLocalizedString("black", comment: ""),NSLocalizedString("yellow", comment: "")]
    
    // judge
    /// judge that controls the game
    var judge: Judge?
    
    
    // controls
    /// functions of the controll
    
    // Gui: Alterei o UpArrow para select pois estava gerando problemas na identificacao do simulador
    var funcoesControle = ["PlayPause","Menu","Select","Select","LeftArrow","DownArrow","RightArrow","SwipeUp","SwipeLeft","SwipeDown","SwipeRight"];
    /// reporter of control actions
    var report = Report()
    ///Menu button
    let menuPressRecognizer = UITapGestureRecognizer()
    
    
    
    // auxiliar var
    /// number of words played
    var wordsCount: Int = 0
    /// number of events played
    var eventsCount: Int = 0
    /// bool to know if draw scene has passed already
    var drawPassed: Bool = true
    /// number of players in game
    var qtPlayer = UserDefaults.standard.integer(forKey: "numberOfPlayers")
    /// current word at the game
    var currentWord = "" // : String?
    /// current event at the game
    var currentEvent: String? = ""// : String?
    /// current color of the player
    var currentColor = "" // : String?
    /// judge decision about player story
    var judgeDecision = "" // : String?
    /// condition to see which team has lose
    var conditionToFinish : Bool?
    /// team of the time
    var choosenTeam = Team()
    /// bool to know if game still running
    var gameRunning = true
    /// sound player
    let sound = Sound()
    var delegate: StatisticsProtocol?
    
    // words and events
    // all words
    
    /// all events
    var allEvents = [Event]()
    
    var randomEvent : String? = ""
    var randomWord = ""
    
    //User Defaults
    let defaults = AllUserDefault()
    
    override func viewDidLoad() {
//        gameView.addSubview(pauseView)
//        pauseView.sendSubviewToBack(gameView)
        defaults.isOnGame = true
        defaults.screenNumber = 2
        pauseView.alpha = 0.0
        quitGameView.alpha = 0.0
        super.viewDidLoad()
//        pauseView.
//        menuPressRecognizer.addTarget(self, action: #selector(GameViewController.Menu(recognizer:)))
//        menuPressRecognizer.allowedPressTypes = [NSNumber(value: UIPress.PressType.menu.rawValue)]
//        self.view.addGestureRecognizer(menuPressRecognizer)
        UserDefaults.standard.set(true, forKey: "flag")
        UserDefaults.standard.set(true, forKey: "flag2")
        
        setupGame()
        startTheme()
    }
    
    /**
     Function to start the game with theme scene
     */
    func startTheme(){
        let size: CGSize = view.bounds.size
        themeScene = ThemeScene(size: size)
        gameView.presentScene(themeScene)
    }
    
    /**
     Setup the game (colors, players, judge, words, team, controller)
     */
    
    var language = ""
    func setupGame(){
        
        if NSLocalizedString("startText", comment: "") == "Start"{
            language = "EN"
        } else{
            language = "PT"
        }
        // instantiate and add teams to team array
        team.append(Team(UserDefaults.standard.integer(forKey: "numberOfPlayers")))
        team.append(Team(UserDefaults.standard.integer(forKey: "numberOfPlayers")))
        choosenTeam = team[0]
        
        // instantiate and add person to players array
        for i in 0...UserDefaults.standard.integer(forKey: "numberOfPlayers") - 1{
            if i < UserDefaults.standard.integer(forKey: "numberOfPlayers")/2{
                players.append(Person(colors[i], team: team[0]))
            } else {
                players.append(Person(colors[i], team: team[1]))
            }
        }
        
        // instantiate
        judge = Judge(team)        
        addAll()
        //Add gesture
        
        // create class to stored players info
        for i in 0...qtPlayer - 1{
            print(players[i].color)
            playersInfo.append(StatisticsInfo(color: players[i].color))
//            for _ in 0...9{
//                playersInfo[i].addWord(word: "")
//            }
        }
    }
    
    /**
     Function to add controller, words and events
     */
    func addAll(){
        addController()
        addWords()
        addEvents()
    }
    
    /**
     Function to add the controller
     */
    func addController(){
        var _ = SiriRemote(self.view)
        for i in 0..<funcoesControle.count{
            self.view.gestureRecognizers?[i].addTarget(self, action: Selector(funcoesControle[i]))
        }
    }
    
    /**
     Function to remove the controller
     */
    func rmvController(){
        var _ = SiriRemote(self.view)
        for i in 0..<funcoesControle.count{
            self.view.gestureRecognizers?[i].removeTarget(self, action: Selector(funcoesControle[i]))
        }
    }
    
    /**
     Function to add words
     */
    
    var hardDeck = false
    var normalDeck = false
    
    var actualDeck = [String]()
    
    func addWords(){
        let words = Words()
        let difficulty = UserDefaults.standard.integer(forKey: "difficulty")

        let theme = UserDefaults.standard.integer(forKey: "deck")
        switch theme - 1{
        case 0:
            if language == "EN"{
            actualDeck = words.strNinjaEN
            } else{
                actualDeck = words.strNinja
            }
        case 1:
            if language == "EN"{
            actualDeck = words.strFood
                } else{
                actualDeck = words.strFood
            }
        case 2:
            if language == "EN"{
                actualDeck = words.strMagicEng
            } else{
                actualDeck = words.strMagic
            }
        case 3:
            if language == "EN"{
                actualDeck = words.strAnimalEng
            } else{
                actualDeck = words.strAnimal
            }
        case 4:
            if language == "EN"{
                actualDeck = words.strOldWest
            } else{
                actualDeck = words.strOldWest
            }
        case 5:
            if language == "EN"{
                actualDeck = words.strNatal
            } else{
                actualDeck = words.strNatal
            }
        default:
            if language == "EN"{
                actualDeck = words.normalStrEng
            } else{
                actualDeck = words.strNormal
            }
        }
        
    }
    
    /**
     Function to add events
     */
    func addEvents(){
        let events = allEventsSigned()
        if language == "PT"{
        for element in  events.events{
            allEvents.append(Event(element, difficulty: 0, type: "", duration: 0))
            }
            
        } else{
            for element in  events.eventsEnglish{
                       allEvents.append(Event(element, difficulty: 0, type: "", duration: 0))
                       }
        }
       
    }
    
    /**
     Function to end game by team life or by the judge
     */
    func finishGame(team: Team, judge: Judge){
        defaults.isOnGame = false
        if team.lifes != 0{
            judge.deny(team)
        }else{
            judge.endGame()
        }
    }
    
    /**
     Function to report judge decision by control
     */
    func addToReport(){
        report.addTurn(currentWord, color: currentColor)
    }
    
    /**
     Function to pause game
     */
    @objc func PlayPause(){
        print("pause")
    }
    
    /**
     Function to pause game
     */
    @objc func Menu(/*recognizer: UITapGestureRecognizer*/){
        print("menu")
        //Pause o tempo
        //Pausa a cena
        //Se não estiver no menu
        if defaults.isPaused == false{
            defaults.isPaused = true
//            pauseScene?.buttonToBackToTheGame.addTarget(self, action: #selector(pressPauseBackToTheGameBtn), for: .touchUpInside)
            defaults.positionOnTheGameScreen = 2
            pauseScene = PauseScene(size: CGSize(width: (UIScreen.main.bounds.width)*0.5, height: (UIScreen.main.bounds.height)*0.5))
            gameScene?.endTimer()
            gameScene?.isPaused = true
            pauseView.alpha = 1.0
            pauseView.presentScene(pauseScene)
            
        }else{
            if defaults.isQuitable == true{
                defaults.isPaused = false
                defaults.isQuitable = false
                defaults.positionOnTheGameScreen = 1
//                quitGameView.removeFromSuperview()
                pauseScene = nil
                quitGameScene = nil
                gameScene?.startTimer()
                gameScene?.isPaused = false
                pauseView.alpha = 0.0
                quitGameView.alpha = 0.0
            }else{
                quitGameScene = QuitGameScene(size: CGSize(width: (UIScreen.main.bounds.width)*0.45, height: (UIScreen.main.bounds.height)*0.45))
//               pauseView.addSubview(quitGameView)
                defaults.isQuitable = true
                defaults.positionOnTheGameScreen = 3
                quitGameView.alpha = 1.0
                quitGameView.presentScene(quitGameScene)
            }
            
        }
    }
    
    /**
     functions of the controller (Select)
     */
    @objc func Select(){
        
        //if gameScene?.scene == themeScene{
            //changeScene()
        //}
    }
    
    @objc func UpArrow(){
        print("uparrow")
    }
    
    @objc func LeftArrow(){
        print("leftarrow")
    }
    
    @objc func DownArrow(){
        print("downarrow")
    }
    
    @objc func RightArrow(){
        print("rightarrow")
    }
    
    @objc func SwipeUp(){
        print("swipeup")
    }
    
    var vencedor = ""
    @objc func SwipeLeft(){
        
        if (GameScene.turn > 0) && gameView.scene == gameScene {
            if !chooseOption{
                sound.play("SwipeLeft", type: ".wav",repeat: 0)
                chooseOption.toggle()
            }
            if choosenTeam == team[0]{
                self.gameScene!.mostrarBalao1()
                judge?.deny(team[1])
            } else{
                self.gameScene!.mostrarBalao0()
                judge?.deny(team[0])
            }
            
            if team[0].lifes == 0 || team[1].lifes == 0{
                if team[0].lifes == 0{
                    vencedor = "Time 2"
                } else{
                    vencedor = "Time 1"
                }
                
                switch(qtPlayer){
                case 2:
                    self.performSegue(withIdentifier: "endGame3", sender: nil)
                    break
                case 4:
                    self.performSegue(withIdentifier: "endGame5", sender: nil)
                    break
                default:
                    self.performSegue(withIdentifier: "endGame7", sender: nil)
                }
                
            }
            self.gameScene?.juizBravo()
            self.gameScene?.endTimer()
            
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.chooseOption = false
                self.changeScene()
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "endGame"{
//            if let vc = segue.destination as? ViewController{
//                vc.vencedor = vencedor
//                vc.delegate = self
//            }
        }
        switch segue.identifier {
        case "endGame3":
            if let vc = segue.destination as? Report3ViewController{
                print("endGame3")
                self.delegate = vc
            }
            break
        case "endGame5":
            if let vc = segue.destination as? Report5ViewController{
                self.delegate = vc
            }
            break
        default:
            if let vc = segue.destination as? Report7ViewController{
                self.delegate = vc
            }
        }
        self.delegate?.sendPlayersInfo(playersInfo: playersInfo)
    }
    
    
    @objc func SwipeDown(){
        print("swipedown")
    }
    
    var chooseOption = false
    
    @objc func SwipeRight(){
        
        if gameView.scene == gameScene && GameScene.turn > 0  {
            if !chooseOption{
                sound.play("SwipeRight", type: ".wav",repeat: 0)
                chooseOption.toggle()
            }
            
            self.gameScene?.juizFeliz()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.chooseOption = false
                // FAZ O TEMPO PARAR AQUI GABS PLS
                //self.gameScene?.endTimer()
                
                self.changeScene()
            }
        } else{
            changeScene()
        }
        
    }
    
    var teamTurnA = 0
    
    var teamTurnB = UserDefaults.standard.integer(forKey: "numberOfPlayers")/2
    
    var numberPlayer = 0
    
    func readjustPlayers(){
        teamTurnA = 0
        teamTurnB = players.count/2
        numberPlayer = 0
        definePlayerTurn()
    }
    
    func definePlayerTurn (){
        if (GameScene.turn > -1){
            if (GameScene.turn % 2 == 0)  {
                playerTurn = players[teamTurnA]
                numberPlayer = teamTurnA
                teamTurnA += 1
            } else {
                playerTurn = players[teamTurnB]
                numberPlayer = teamTurnB
                teamTurnB += 1
            }
            
        }
    }
    
    
    func randomStuff(){
        currentWord = actualDeck.randomElement()!
        
        if GameScene.turn % 4 == 0{
            currentEvent = allEvents.randomElement()?.descriptionEvent
        } else{
            currentEvent = ""
        }
        
    }
    var auxFirst = 5
    var auxSecond = 5
    
    func defineEventPlayer(){
        if teamTurnA == firstSortedForEvent{
            randomEvent = allEvents.randomElement()?.descriptionEvent
            auxFirst = firstSortedForEvent
            firstSortedForEvent = 9
            
        } else
            if teamTurnB == secondSortedForEvent{
                randomEvent = allEvents.randomElement()?.descriptionEvent
                auxSecond = secondSortedForEvent
                secondSortedForEvent = 9
                
                
            } else{
                randomEvent = ""
        }
        
    }
    
//    @objc func pressPauseBackToTheGameBtn(_ sender: AnyObject?){
//
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        let touch: UITouch = touches.first as! UITouch
        
        if (touch.view == pauseScene?.buttonToBackToTheGame){
            print("touchesBegan | This is an ImageView")
        }else{
            print("touchesBegan | This is not an ImageView")
        }
    }
    
    
    /**
     Function to change scenes
     */
    func changeScene(){
        let size = view.bounds.size
        
        if GameScene.turn >= 0 {
            randomStuff()
        }
        
        print("Random event -> \(randomEvent!)")
        switch gameView.scene {
        case themeScene:
            gameScene = GameScene(size: size, word: currentWord, team1: team[0], team2: team[1], judge: judge!, players: players)
            gameScene?.delegateSend = self
            gameView.scene?.removeFromParent()
            print("Piru")
            gameView.presentScene(gameScene)
            break
        case gameScene:
            gameScene?.timer?.invalidate()
            gameView.scene?.removeFromParent()            
            if GameScene.turn % qtPlayer != 0 || drawPassed{
                drawPassed = false
                definePlayerTurn()
                defineEventPlayer()
                
                
                turnScene = TurnScene(size: size, player: playerTurn,word: currentWord,event: randomEvent!)
                randomWord = currentWord
                
                gameView.presentScene(turnScene)
            } else {
                // criar a cena do sorteio
                drawScene = DrawScene(size: size, players: players)
                drawScene?.randomDelegate = self
                drawScene?.drawDice()
                readjustPlayers()
                
                
                gameView.presentScene(drawScene)
            }
            break
        case turnScene:
            if choosenTeam == team[0] {
                choosenTeam = team[1]
            } else{
                choosenTeam = team[0]
            }
            gameView.scene?.removeFromParent()
            
            if let event = randomEvent{
                gameScene = GameScene(size: size, word: randomWord, event: event, team1: team[0], team2: team[1], judge: judge!, players: players)
            } else {
                gameScene = GameScene(size: size, word: randomWord, team1: team[0], team2: team[1], judge: judge!, players: players)
                
            }

            if auxFirst == 5{
                gameScene!.sendSortedEvent(auxFirst,auxSecond)
            }
            addWordInfo(color: playerTurn.color, word: randomWord)
            gameScene?.movePlayer(playerNumber: numberPlayer)
            gameScene?.delegateSend = self
            gameView.presentScene(gameScene)
            break
        case drawScene:
            randomStuff()
            randomWord = currentWord
            defineEventPlayer()
            turnScene = TurnScene(size: size,player: playerTurn,word: randomWord,event: randomEvent!)
            gameView.scene?.removeFromParent()
            
            gameView.presentScene(turnScene)
            drawPassed = true
            
            break
        case pauseScene:
            
            break
        default:
            print("None Scene")
        }
        
    }
    
    /**
     Add the actual word to player info class
     */
    func addWordInfo(color: String, word: String){
        for player in playersInfo{
            if player.pinColor == color{
                print(word)
                player.addWord(word: word)
            }
        }
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        guard let focus = context.nextFocusedView else {return}
        
        switch  defaults.positionOnTheGameScreen{
        case 2:
            switch focus{
            case pauseScene?.buttonToBackToTheGame:
//                if language == "PT"{
//                    self.pauseScene?.buttonToBackToTheGame.setImage(jogarSel,for: .normal)
//                } else{
//                    self.pauseScene?.buttonToBackToTheGame.setImage(playSel,for: .normal)
//                }
                break
            default:
//                if language == "PT"{
//                    self.shopButton.setImage(lojaSel,for: .normal)
//                } else{
//                    self.shopButton.setImage(shopSel,for: .normal)
//                }
                break
                
            }
            
//            if  focus != self.pauseScene?.buttonToBackToTheGame {
//              if language == "PT"{
//                self.pauseScene?.buttonToBackToTheGame.setImage(jogarDes,for: .normal)
//                } else{
//                    self.pauseScene?.buttonToBackToTheGame.setImage(playDes,for: .normal)
//                }
//            }
            
//            if focus != self.settingsButton{
//               if language == "PT"{
//                    self.settingsButton.setImage(configuracoesDes,for: .normal)
//                } else{
//                    self.settingsButton.setImage(configDes,for: .normal)
//                }
//            }
            break
        case 3:
            switch focus{
            case quitGameScene?.buttonToBackToTheGame:
//                if language == "PT"{
//                    self.quitGameScene?.buttonToBackToTheGame.setImage(jogarSel,for: .normal)
//                } else{
//                    self.quitGameScene?.buttonToBackToTheGame.setImage(playSel,for: .normal)
//                }
                break
            default:
//                if language == "PT"{
//                    self.quitGameScene?.buttonToBackToTheScreen.setImage(lojaSel,for: .normal)
//                } else{
//                    self.quitGameScene?.buttonToBackToTheScreen.setImage(shopSel,for: .normal)
//                }
                break
                
            }
            
//            if  focus != self.startButton {
//              if language == "PT"{
//                self.startButton.setImage(jogarDes,for: .normal)
//                } else{
//                    self.startButton.setImage(playDes,for: .normal)
//                }
//            }
            
//            if focus != self.settingsButton{
//               if language == "PT"{
//                    self.settingsButton.setImage(configuracoesDes,for: .normal)
//                } else{
//                    self.settingsButton.setImage(configDes,for: .normal)
//                }
//            }
            break
        default:
            break
            
        }
        
        
        
        
        updateFocusIfNeeded()
        
    }
}
