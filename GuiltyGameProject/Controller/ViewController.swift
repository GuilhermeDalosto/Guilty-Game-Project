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

    var allWords =  [Word]()
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
    
    
    
    var gameRunning = true;
    var a = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
          
        print("this View Controller")
        
        
        
        // Do any additional setup after loading the view.
        
        addAll()
        gameRunning = false
        while (gameRunning){
            // startRound()
            // Startar timer, resetar os currents...
            currentWord = allWords[a].title
            currentEvent = allEvents[a].descriptionEvent
            currentColor = colors[a]
            
            
            print("A palavra da vez é \(currentWord)")
            print("O evento é \(currentEvent)")
            
            print("É a vez de \(currentColor)")
            //print("É a vez de \(firstTeam.persons[0].color)" )
            
            
            // DECISAO JUIZ
            
            
            report.addTurn(currentWord, color: currentColor)
            
          //  judgeDecision = judge.deny()
            
            
            
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
        for element in words.strAnimal{
            allWords.append(Word(element, difficulty: 0, deck: element))
        }
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

