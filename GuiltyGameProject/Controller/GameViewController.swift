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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // init for player that gain a event -> GameScene(size: view.bounds.size, word: , event: )
        gameScene = GameScene(size: view.bounds.size, word: "")
        gameView.presentScene(gameScene)
    }
}
