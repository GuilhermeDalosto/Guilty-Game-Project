//
//  ViewController.swift
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 25/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    // ALL WORDS
    var wordsRandom =  [String]()
    var wordsHard = [String]()
    var wordsFood = [String]()
    var wordsFoodHard = [String]()
    var wordsMagic = [String]()
    var wordsAnimal = [String]()
    var wordsAnimalHard = [String]()
    var wordsOldWest = [String]()
    var wordsNinja = [String]()
    var wordsChristmas = [String]()
    
    
    
    
    var allEvents = [Event]()

    var persons = [Person]()
    var colors = ["Blue","Green","Purple","Yellow","Red","Orange"]
    var funcoesControle = ["PlayPause","Menu","Select","UpArrow","LeftArrow","DownArrow","RightArrow","SwipeUp","SwipeLeft","SwipeDown","SwipeRight"];
    
    // Receber a quantidade por delegate
    var qtPlayer = 4
    var firstTeam = Team(2)
    var secondTeam = Team(2)
    
    var judge = Judge()
    var report = Report()
    
    var currentWord = "" // : String?
    var currentEvent = ""// : String?
    var currentColor = "" // : String?
    
    var judgeDecision = "" // : String?
    ///Condição para verificar qual será o time que irá perder, se perder
    var conditionToFinish : Bool?
    
    var choosenTeam: Team?
    
    
    
    var gameRunning = true;
    var a = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

        addAll()
        gameRunning = false

        while (gameRunning){
            // startRound()
            // Startar timer, resetar os currents...
           // currentWord = allWords[a].title
            currentEvent = allEvents[a].descriptionEvent
            currentColor = colors[a]
            
            
            print("A palavra da vez é \(currentWord)")
            print("O evento é \(currentEvent)")
            
            print("É a vez de \(currentColor)")
            //print("É a vez de \(firstTeam.persons[0].color)" )
            
            
            // DECISAO JUIZ
            
            
            report.addTurn(currentWord, color: currentColor)
            
            if(Team.turn){
                choosenTeam = firstTeam
            }else{
                choosenTeam = secondTeam
            }
            
            ///Quando o jogo for acabar
            if conditionToFinish != nil{
                finishGame(team: choosenTeam!, judge: judge)
            }
            
            a += 1
            
            if a == 3{
            gameRunning = false;
            }
            
        }

      
        report.show();
        
        
    }
    
    func addAll(){
        addController()
        addWords()
        addEvents()
        addJudge()
    }
    
    func addController(){
      var _ = SiriRemote(self.view)
        for i in 0..<funcoesControle.count{
            self.view.gestureRecognizers?[i].addTarget(self, action: Selector(funcoesControle[i]))
        }
    }

    func addWords(){
        let words = Words()
        
        for element in words.str{
            wordsRandom.append(element)
        }
        for element in words.strFood{
            wordsFood.append(element)
        }
        for element in words.strHardFood{
            wordsFoodHard.append(element)
        }
        for element in words.strMagic{
            wordsMagic.append(element)
        }
        for element in words.strAnimal{
            wordsRandom.append(element)
        }
        for element in words.strHardAnimal{
            wordsAnimalHard.append(element)
        }
        for element in words.strOldWest{
            wordsOldWest.append(element)
        }
        for element in words.strNinja{
            wordsNinja.append(element)
        }
        for element in words.strNormalWords{
            wordsRandom.append(element)
        }
        for element in words.strHardWords{
            wordsHard.append(element)
        }
        for element in words.strNatal{
            wordsChristmas.append(element)
        }
        
        var random = Deck("Random", cards: wordsRandom as! NSMutableArray, hardCards: wordsHard as! NSMutableArray)
        var food = Deck("Food", cards: wordsFood as! NSMutableArray, hardCards: wordsFoodHard as! NSMutableArray)
        var magic = Deck("Magic", cards: wordsMagic as! NSMutableArray, hardCards: wordsMagic as! NSMutableArray)
        var animal = Deck("Animal", cards: wordsRandom as! NSMutableArray, hardCards: wordsAnimalHard as! NSMutableArray)
        var oldwest = Deck("Old West", cards: wordsOldWest as! NSMutableArray, hardCards: wordsOldWest as! NSMutableArray)
        var ninja = Deck("Ninja", cards: wordsNinja as! NSMutableArray, hardCards: wordsNinja as! NSMutableArray)
        var christmas = Deck("Christmas", cards: wordsChristmas as! NSMutableArray, hardCards: wordsChristmas as! NSMutableArray)
        
        
        
        print(christmas.cards)
    }
    
    func addEvents(){
        let events = allEventsSigned()
        for element in  events.events{
            allEvents.append(Event(element, difficulty: 0, type: "", duration: 0))
        }
    }

    func addPlayers(){
        
        for i in 0...qtPlayer/2{
            firstTeam.addPlayer(Person(colors[i], team: firstTeam))
           
        }
        
        for j in qtPlayer/2 + 1...qtPlayer{
            secondTeam.addPlayer(Person(colors[j], team: secondTeam))
        }
        
    }
        
    func addJudge(){
        
    }
    
    func finishGame(team: Team, judge: Judge){
        if team.lifes != 0{
            judge.deny(team)
        }else{
            judge.endGame()
        }
    }
    
    func addToReport(){
        report.addTurn(currentWord, color: currentColor)
    }

    @objc func PlayPause(){
        print("pause")
    }
    
    @objc func Menu(){
        print("menu")
    }
    
    @objc func Select(){
        print("select")
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
    
    @objc func SwipeLeft(){
        print("swipeleft")
    }
    
    @objc func SwipeDown(){
        print("swipedown")
    }
    
    @objc func SwipeRight(){
        print("swiperight")
    }
}

