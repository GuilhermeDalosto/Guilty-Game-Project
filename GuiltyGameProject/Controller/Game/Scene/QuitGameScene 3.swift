//
//  QuitGameScene.swift
//  GuiltyGameProject
//
//  Created by Victor Dângelo Teixeira Ciccarini on 27/01/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import UIKit

class QuitGameScene: SKScene {
    
    ///Botão que irá voltar para o jogo
    var buttonToBackToTheGame: SKSpriteNode?
    ///Botão que irá voltar para a tela do menu
    var buttonToBackToTheScreen: SKSpriteNode?
    ///Botão que irá voltar para a tela do menu
    var textPaused = ""
    
    override init(size: CGSize) {
        super.init(size: size)
        buttonToBackToTheGame = generateButton(x: UIScreen.main.bounds.width*0.125, y: UIScreen.main.bounds.height*0.125, width: 100, height: 100)
        buttonToBackToTheScreen = generateButton(x: UIScreen.main.bounds.width*0.375, y: UIScreen.main.bounds.height*0.125, width: 100, height: 100)
        backgroundColor = UIColor.green
        addChild(buttonToBackToTheGame!)
        addChild(buttonToBackToTheScreen!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func generateButton(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> SKSpriteNode?{
        let btn = SKSpriteNode(imageNamed: "")
        btn.position = CGPoint(x: x, y: y)
        btn.size = CGSize(width: width, height: height)
        return btn
    }
    
}
