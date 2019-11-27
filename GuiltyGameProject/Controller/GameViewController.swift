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
    
    let gameScene = GameScene()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Passou aq")
        gameView.presentScene(gameScene)
    }
}
