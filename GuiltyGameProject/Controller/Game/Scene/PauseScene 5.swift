//
//  PauseScene.swift
//  GuiltyGameProject
//
//  Created by Victor Dângelo Teixeira Ciccarini on 05/12/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import UIKit

class PauseScene: SKScene {
    
    ///Botão que irá voltar para o jogo
    var buttonToBackToTheGame: SKSpriteNode?
    ///Botão que irá voltar para a tela do menu
    var textPaused = ""
    
    var backgroundImage = SKSpriteNode()
    
    var buttonToGoMenu = SKSpriteNode()
    
    override init(size: CGSize) {
        super.init(size: size)
        buttonToBackToTheGame = generateButton(x: UIScreen.main.bounds.width*0.145, y: UIScreen.main.bounds.height*0.165, width: 200, height: 50)
//        backgroundColor = UIColor.green
        backgroundConfig()
        quitButton()
        addChild(backgroundImage)
        addChild(buttonToBackToTheGame!)
        addChild(buttonToGoMenu)
    }
   
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func generateButton(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> SKSpriteNode?{
       
        var btn = SKSpriteNode()
        
        if NSLocalizedString("startText", comment: "") == "Start"{
            btn = Botaozaum(imageNamed: "back")
        } else {
            btn = Botaozaum(imageNamed: "voltar")
        }
        
        
        btn.position = CGPoint(x: x, y: y)
        btn.size = CGSize(width: 273.77 , height: 90.832)
        btn.zPosition += 100
        
        return btn
    }
    
    func backgroundConfig() {
        
        if NSLocalizedString("startText", comment: "") == "Start"{
            backgroundImage = SKSpriteNode(imageNamed: "pauseEN")
        } else {
            backgroundImage = SKSpriteNode(imageNamed: "pausePT")
        }
        
        backgroundImage.alpha = 0.6
        backgroundImage.position = CGPoint(x: size.width/2, y: size.height/2)
//        backgroundImage.size = CGSize(width: 1000, height: 400)
        
    }
    
    func quitButton() {

        
        if NSLocalizedString("startText", comment: "") == "Start"{
            buttonToGoMenu = Botaozaum(imageNamed: "quit")
        } else {
            buttonToGoMenu = Botaozaum(imageNamed: "sair")
        }
        
        
        buttonToGoMenu.position = CGPoint(x: UIScreen.main.bounds.width*0.345, y: UIScreen.main.bounds.height*0.165)
        buttonToGoMenu.size = CGSize(width: 273.77 , height: 90.832)
        buttonToGoMenu.zPosition += 100
    }
}
