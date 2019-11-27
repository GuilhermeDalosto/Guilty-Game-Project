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
    var team1: Team = Team()
    var team2: Team = Team()
    var judge: Judge = Judge()
    var words = [Word]()
    var events = [Event]()
    var wordsCount: Int = 0
    var eventsCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let size: CGSize = view.bounds.size
        //init for player that gain a event -> GameScene(size: view.bounds.size, word: words[], event: events[])
        gameScene = GameScene(size: size, word: words[wordsCount], team1: team1, team2: team2, judge: judge)
//        (size: CGSize, word: Word, event: Event, team1: Team, team2: Team, judge: Judge)
        gameView.presentScene(gameScene)
        wordsCount += 1
    }
}
