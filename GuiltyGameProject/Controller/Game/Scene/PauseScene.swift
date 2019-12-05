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
    var buttonToBackToTheScreen: SKSpriteNode?
    ///Botão que irá voltar para a tela do menu
    var textPaused = ""
    
    override init(size: CGSize) {
        super.init(size: size)
        buttonToBackToTheGame = generateButton(x: 0, y: 0, width: 0, height: 0)
        buttonToBackToTheScreen = generateButton(x: 0, y: 0, width: 0, height: 0)
        backgroundColor = UIColor.black
        addChild(buttonToBackToTheGame!)
        addChild(buttonToBackToTheScreen!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func generateButton(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> SKSpriteNode?{
        let btn = SKSpriteNode(fileNamed: "")
        btn?.position = CGPoint(x: x, y: y)
        btn?.size = CGSize(width: width, height: height)
        return btn
    }
    
}
