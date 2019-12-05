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

class GameViewController: UIViewController{
    
    @IBOutlet weak var gameView: SKView!
    
    var gameScene: GameScene? = nil
    var team = [Team]()
    var judge: Judge?
    var players = [Person]()
    var events = [Event]()
    var words = [String]()
    var colors = [String]()
    var wordsCount: Int = 0
    var eventsCount: Int = 0
    var pauseScene: PauseScene? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let size: CGSize = view.bounds.size
        
        //init for player that gain a event -> GameScene(size: view.bounds.size, word: words[], event: events[])
        gameScene = GameScene(size: size, word: words[wordsCount], team1: team[0], team2: team[1], judge: judge!, players: players)
//        (size: CGSize, word: Word, event: Event, team1: Team, team2: Team, judge: Judge)
        gameView.presentScene(gameScene)
        wordsCount += 1
    }
    
    func setupGame(){
        // pegar as cores e adicionar ao array colors
        // PROVISORIO
        colors.append("Black")
        colors.append("White")
        colors.append("Yellow")
        colors.append("Red")
        colors.append("Green")
        colors.append("Grey")
        
        // instantiate and add teams to team array
        team.append(Team(UserDefaults.standard.integer(forKey: "numberOfPlayers")))
        
        // instantiate and add person to players array
        for i in 0...UserDefaults.standard.integer(forKey: "numberOfPlayers") - 2{
            if i < UserDefaults.standard.integer(forKey: "numberOfPlayers")/2{
                players.append(Person(colors[i], team: team[0]))
            } else {
                players.append(Person(colors[i], team: team[1]))
            }
        }
        
        // instantiate
        judge = Judge(team)
        
        // instantiate words to build a deck
        
        // instantiate events
        
    }
    
    @objc func PlayPause(){
        print("pause")
    }
    
    @objc func Menu(){
        print("menu")
        //Pause o tempo
        //Pausa a cena
        //Se não estiver no menu
        gameScene?.endTimer()
        gameScene?.isPaused = true
        gameView.presentScene(pauseScene)
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
