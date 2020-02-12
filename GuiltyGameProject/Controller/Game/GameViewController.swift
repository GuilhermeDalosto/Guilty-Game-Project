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

class GameViewController: UIViewController, sendTimerDelegate, randomDelegate, passMusicDelegate{
    func passMusic(music: AVAudioPlayer) {
        music1 = music
    }
    
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
    
    //Views
    @IBOutlet weak var gameView: SKView!
    @IBOutlet var pauseUIView: UIView!
    @IBOutlet var quitGameUIView: UIView!
    
    //Pause Images
    @IBOutlet weak var pauseScreen: UIImageView!
    @IBOutlet weak var quitGameScreen: UIImageView!
    
    
    
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
    
    /// scene of quit game
    
    // scene of preparation
    var preparationScene : PreparationScene? = nil
    
    
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
    var music1 : AVAudioPlayer?
    var musicSound = Sound()
    var delegate: StatisticsProtocol?
    
    // words and events
    // all words
    
    /// all events
    var allEvents = [Event]()
    
    var randomEvent : String? = ""
    var randomWord = ""
    
    //User Defaults
    let defaults = AllUserDefault()
    
    //Botões da tela de pause
    ///Botão para voltar ao jogo
    @IBOutlet weak var backToTheGameBtn: UIButton!
    
    ///Botão para sair do jogo
    @IBOutlet weak var quitGameBtn: UIButton!
    
    ///Botão para confirmar a saida do jogo
    @IBOutlet weak var yesBtn: UIButton!
    
    ///Botão para voltar ao pause do jogo
    @IBOutlet weak var noBtn: UIButton!
    
    
    override func viewDidLoad() {
        //        musicSound.change(music1!)
        defaults.isOnGame = true
        defaults.screenNumber = 2
        super.viewDidLoad()
        //        pauseView.
        UserDefaults.standard.set(true, forKey: "flag")
        UserDefaults.standard.set(true, forKey: "flag2")
        
        setupGame()
        
        startTheme()
        
        startPreparation()
        
        
        
    }
    
    
    func startPreparation(){

        preparationScene = PreparationScene(size: view.bounds.size)
        preparationScene?.qtdPinos = qtPlayer
        preparationScene?.changeJuiz()
        self.gameView.presentScene(preparationScene)
        
    }
    /**
     Function to start the game with theme scene
     */
    
    func startTheme(){
        let size: CGSize = view.bounds.size
        themeScene = ThemeScene(size: size)     
        self.gameView.presentScene(themeScene)
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
        switch theme{
        case 1:
            if language == "EN"{
                actualDeck = words.strNinja
            } else{
                actualDeck = words.strNinja
            }
        case 2:
            if language == "EN"{
                actualDeck = words.strFoodEng
                if difficulty == 1{
                    actualDeck = words.strFoodHardEng
                }
            } else{
                actualDeck = words.strFood
                if difficulty == 1{
                    actualDeck = words.strHardFood
                }
            }
        case 3:
            if language == "EN"{
                actualDeck = words.strMagicEng
            } else{
                actualDeck = words.strMagic
            }
        case 4:
            if language == "EN"{
                actualDeck = words.strAnimalEng
                if difficulty == 1{
                    actualDeck = words.strAnimalHardEng
                }
            } else{
                actualDeck = words.strAnimal
                if difficulty == 1{
                    actualDeck = words.strHardAnimal
                }
            }
        case 5:
            if language == "EN"{
                actualDeck = words.strOldWestEN
            } else{
                actualDeck = words.strOldWest
            }
        case 6:
            if language == "EN"{
                actualDeck = words.strNatal
            } else{
                actualDeck = words.strNatal
            }
        case 0:
            if language == "EN"{
                actualDeck = words.normalStrEng
                if difficulty == 1{
                    actualDeck = words.hardStrEng
                }
            } else{
                actualDeck = words.strNormal
                if difficulty == 1{
                    actualDeck = words.strHardWords
                }
            }
        default:
            if language == "EN"{
                actualDeck = words.normalStrEng
                if difficulty == 1{
                    actualDeck = words.hardStrEng
                }
            } else{
                actualDeck = words.strNormal
                if difficulty == 1{
                    actualDeck = words.strHardWords
                }
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
     Function to end game by the player
     */
    func finishGame(judge: Judge){
        defaults.isOnGame = false
        judge.endGame()
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
    
    //MARK: - Menu
    /**
     Function to pause game
     */
    @objc func Menu(/*recognizer: UITapGestureRecognizer*/){
        print("menu")
        if defaults.isPaused == false, defaults.isQuitable == false{
            //            pauseScene?.buttonToBackToTheGame.addTarget(self, action: #selector(pressPauseBackToTheGameBtn), for: .touchUpInside)
            pause()
            //            self.setNeedsFocusUpdate()
            //            self.updateFocusIfNeeded()
            
        }else{
            if defaults.isQuitable == true{
                quitGame()
            }else{
                quitPause()
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
        if self.pauseUIView.isDescendant(of: self.view) ||  self.quitGameUIView.isDescendant(of: self.view){
            
        }else{
            if (GameScene.turn > 0) && gameView.scene == gameScene {
                if !chooseOption{
                    sound.play("SwipeLeft", type: ".wav",repeat: 0)
                    chooseOption.toggle()
                    
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
                            UserDefaults.standard.set(2, forKey: "vencedor")
                        } else{
                            vencedor = "Time 1"
                            UserDefaults.standard.set(1, forKey: "vencedor")
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
                    
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.chooseOption = false
                    self.changeScene()
                }
            }
            self.gameScene?.juizBravo()
            self.gameScene?.endTimer()
            
        }
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        GameScene.turn = 0
        GameScene.round = 0
        if segue.identifier == "endGame"{
            
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
        case "endGame7":
            if let vc = segue.destination as? Report7ViewController{
                self.delegate = vc
            }
        default:
            break
        }
        if segue.identifier != "unwindToMenu"{
            self.delegate?.sendPlayersInfo(playersInfo: playersInfo)
        }
    }
    
    
    @objc func SwipeDown(){
        print("swipedown")
    }
    
    var chooseOption = false
    
    @objc func SwipeRight(){
        if gameView.scene == preparationScene{
            startTheme()
        }
        if self.pauseUIView.isDescendant(of: self.view) ||  self.quitGameUIView.isDescendant(of: self.view){
                   
               }else{
        if gameView.scene == gameScene && GameScene.turn > 0  {
            if !chooseOption{
                sound.play("SwipeRight", type: ".wav",repeat: 0)
                chooseOption.toggle()
                
                if self.pauseUIView.isDescendant(of: self.view)  ||  self.quitGameUIView.isDescendant(of: self.view) {
                    print("oi")
                } else{
                    if gameView.scene == gameScene && GameScene.turn > 0  {
                        if !chooseOption{
                            sound.play("SwipeRight", type: ".wav",repeat: 0)
                            chooseOption.toggle()
                        }
                        
                        self.gameScene?.juizFeliz()
                        self.gameScene?.endTimer()
                    }
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.chooseOption = false
                
                
                self.changeScene()
            }
        } else{
            changeScene()
        }
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
            //            gameScene = GameScene(size: size, word: currentWord, team1: team[0], team2: team[1], judge: judge!, players: players)
            gameScene?.delegateSend = self
            //            print("Piru")
            //            gameView.presentScene(gameScene)
            definePlayerTurn()
            defineEventPlayer()
            turnScene = TurnScene(size: size, player: playerTurn, word: currentWord, event: randomEvent!)
            randomWord = currentWord
            gameView.scene?.removeFromParent()
            gameView.presentScene(turnScene)
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
    
    // MARK: - Comandos dos botões de pause
    @IBAction func keepPlaying(_ sender: Any) {
        unPause()
    }
    
    @IBAction func leaveMatch(_ sender: Any) {
        quitPause()
    }
    
    @IBAction func leaveMatchDenied(_ sender: Any) {
        unQuitPause()
    }
    
    @IBAction func leaveMatchAccepted(_ sender: Any) {
        quitGame()
    }
    
}

// MARK: - Sub view do pause
extension GameViewController{
    
    ///Essa função é chamada quando se deve entrar no pause
    func pause(){
        defaults.isPaused = true
        gameScene?.endTimer()
        gameScene?.isPaused = true
        defaults.positionOnTheGameScreen = 2
        gameView.addSubview(pauseUIView)
        pauseUIView.center = view.center
        
        
        updateFocusIfNeeded()
        
        
        print(backToTheGameBtn.alpha)
        verifyLanguage(btn: backToTheGameBtn, namePT: "voltar", nameEN: "back")
        //        backToTheGameBtn.setBackgroundImage(UIImage(named: "selecaoGrande"), for: .normal)
        verifyLanguage(btn: quitGameBtn, namePT: "sair", nameEN: "quit")
        //        quitGameBtn.setBackgroundImage(nil, for: .normal)
        verifyLanguage(pauseScreen: pauseScreen, namePT: "pausePT", nameEN: "pauseEN")
    }
    
    ///Essa função é chamada quando se deve sair do pause
    func unPause(){
        defaults.isPaused = false
        defaults.positionOnTheGameScreen = 1
        if gameScene?.time ?? 30 > 0{
            gameScene?.startTimer()
        }
        gameScene?.isPaused = false
        pauseUIView.removeFromSuperview()
    }
    
    ///Essa função é chamada quando se deve ir para seleção de sair ou não do jogo
    func quitPause(){
        defaults.isQuitable = true
        defaults.isPaused = false
        defaults.positionOnTheGameScreen = 3
        gameView.addSubview(quitGameUIView)
        quitGameUIView.center = view.center
        pauseUIView.removeFromSuperview()
        verifyLanguage(btn: yesBtn, namePT: "sim", nameEN: "yes")
        verifyLanguage(btn: noBtn, namePT: "nao", nameEN: "no")
        verifyLanguage(pauseScreen: quitGameScreen, namePT: "encerrarPT", nameEN: "encerrarEN")
    }
    
    ///Essa função é chamada quando se deve ir para seleção de sair ou não do jogo
    func unQuitPause(){
        defaults.isQuitable = false
        defaults.isPaused = true
        defaults.positionOnTheGameScreen = 2
        quitGameUIView.removeFromSuperview()
        gameView.addSubview(pauseUIView)
        pauseUIView.center = view.center
    }
    
    ///Essa função é chamada quando se deve sair do jogo
    func quitGame(){
        defaults.isQuitable = false
        finishGame(judge: judge!)
        quitGameUIView.removeFromSuperview()
        performSegue(withIdentifier: "unwindToMenu", sender: nil)
    }
    
    func verifyLanguage(btn: UIButton, namePT: String, nameEN: String){
        if language == "PT"{
            btn.setImage(UIImage(named: namePT),for: .normal)
        } else{
            btn.setImage(UIImage(named: nameEN),for: .normal)
        }
    }
    
    func verifyLanguage(pauseScreen: UIImageView, namePT: String, nameEN: String){
        if language == "PT"{
            pauseScreen.image = UIImage(named: namePT)
        } else{
            pauseScreen.image = UIImage(named: nameEN)
        }
    }
    
}

// MARK: - Focus Update
extension GameViewController{
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        guard let focus = context.nextFocusedView else {return}
        
        switch  defaults.positionOnTheGameScreen{
        case 2:        
            switch focus{
            case quitGameBtn:
                if language == "PT"{
                    self.quitGameBtn.setImage(UIImage(named: "sair"),for: .normal)
                    quitGameBtn.setBackgroundImage(UIImage(named: "selecaoVGrande"), for: .normal)
                } else{
                    self.quitGameBtn.setImage(UIImage(named: "quit"),for: .normal)
                    quitGameBtn.setBackgroundImage(UIImage(named: "selecaoVGrande"), for: .normal)
                }
                break
            default:
                if language == "PT"{
                    self.backToTheGameBtn.setImage(UIImage(named: "voltar"),for: .normal)
                    backToTheGameBtn.setBackgroundImage(UIImage(named: "selecaoVGrande"), for: .normal)
                } else{
                    self.backToTheGameBtn.setImage(UIImage(named: "back"),for: .normal)
                    backToTheGameBtn.setBackgroundImage(UIImage(named: "selecaoVGrande"), for: .normal)
                }
                break
                
            }
            
            if  focus != self.backToTheGameBtn {
                if language == "PT"{
                    self.backToTheGameBtn.setImage(UIImage(named: "voltar"),for: .normal)
                    backToTheGameBtn.setBackgroundImage(nil, for: .normal)
                } else{
                    self.backToTheGameBtn.setImage(UIImage(named: "back"),for: .normal)
                    backToTheGameBtn.setBackgroundImage(nil, for: .normal)
                }
            }
            
            if focus != self.quitGameBtn{
                if language == "PT"{
                    self.quitGameBtn.setImage(UIImage(named: "sair"),for: .normal)
                    quitGameBtn.setBackgroundImage(nil, for: .normal)
                } else{
                    self.quitGameBtn.setImage(UIImage(named: "quit"),for: .normal)
                    quitGameBtn.setBackgroundImage(nil, for: .normal)
                }
            }
            break
        case 3:
            switch focus{
            case yesBtn:
                if language == "PT"{
                    self.yesBtn.setImage(UIImage(named: "sim"),for: .normal)
                    yesBtn.setBackgroundImage(UIImage(named: "selecaoVPequena"), for: .normal)
                } else{
                    self.yesBtn.setImage(UIImage(named: "yes"),for: .normal)
                    yesBtn.setBackgroundImage(UIImage(named: "selecaoVPequena"), for: .normal)
                }
                break
            default:
                if language == "PT"{
                    self.noBtn.setImage(UIImage(named: "nao"),for: .normal)
                    noBtn.setBackgroundImage(UIImage(named: "selecaoVPequena"), for: .normal)
                } else{
                    self.noBtn.setImage(UIImage(named: "no"),for: .normal)
                    noBtn.setBackgroundImage(UIImage(named: "selecaoVPequena"), for: .normal)
                }
                break
                
            }
            
            if  focus != self.yesBtn {
                if language == "PT"{
                    self.yesBtn.setImage(UIImage(named: "sim"),for: .normal)
                    yesBtn.setBackgroundImage(nil, for: .normal)
                } else{
                    self.yesBtn.setImage(UIImage(named: "yes"),for: .normal)
                    yesBtn.setBackgroundImage(nil, for: .normal)
                }
            }
            
            if focus != self.noBtn{
                if language == "PT"{
                    self.noBtn.setImage(UIImage(named: "nao"),for: .normal)
                    noBtn.setBackgroundImage(nil, for: .normal)
                } else{
                    self.noBtn.setImage(UIImage(named: "no"),for: .normal)
                    noBtn.setBackgroundImage(nil, for: .normal)
                }
            }
            break
        default:
            break
        }
        
        
        updateFocusIfNeeded()
        
    }
    
}
