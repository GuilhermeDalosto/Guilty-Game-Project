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
    
    override init(size: CGSize) {
        super.init(size: size)
        buttonToBackToTheGame = generateButton(x: UIScreen.main.bounds.width*0.250, y: UIScreen.main.bounds.height*0.125, width: 100, height: 100)
        backgroundColor = UIColor.green
        
        addChild(buttonToBackToTheGame!)
    }
   
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func generateButton(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> SKSpriteNode?{
        let btn = Botaozaum(imageNamed: "judge0")
        btn.position = CGPoint(x: x, y: y)
        btn.size = CGSize(width: width, height: height)
        btn.zPosition += 100
        
        return btn
    }
    
    
    
}
