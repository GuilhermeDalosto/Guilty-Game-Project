//
//  ThemeScene.swift
//  GuiltyGameProject
//
//  Created by Ferraz on 28/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import SpriteKit

class ThemeScene: SKScene{
    
    var words = Words().str
    
    var local: [String] = ["Festa", "Casa", "Ponte", "Trabalho", "Predio", "Hotel", "Presídio", "Mar", "Céu", "Ilha", "Praia", "Parque", "Praça", "Banco", "Casa Branca", "Garagem", "Universidade", "Cemitério", "Esgoto", "Bar", "Show", "Festival", "Hospital", "Escola", "Lanchonete", "Shopping", "Laboratório", "Triangulo das Bermudas", "Cinema", "Espaço Sideral", "Montanha", "Deserto", "Área Militar", "Casa do Papai Noel", "Taverna", "Vila"]
    
    var action: [String] = ["Assassinado", "Roubo", "Fuga", "Sequestro", "Jogou lixo no chão", "Apedrejou", "Perseguição", "Invasão", "Briga", "Rinha de Galo", "Sonegar", "Destruição", "Infecção", "Venda Ilegal", "Mentir", "Protesto", "Atirar", "Bateu", "Esfaqueou", "Peidou", "Perdeu"]
    
    var localTheme = SKLabelNode(fontNamed: "MyriadPro-Regular")
    var actionTheme = SKLabelNode(fontNamed: "MyriadPro-Regular")
    var titleLabel = SKLabelNode(fontNamed: "MyriadPro-Regular")
    
    var backgroundImage = SKSpriteNode()
    
    var actionTitle = SKLabelNode(fontNamed: "MyriadPro-Regular")
    
    override init(size: CGSize){
        super.init(size: size)
        // chamar a funcao aleatoria para retornar os temas aleatorios
        
        localTheme.text = local.randomElement()
        localTheme.color = .red
        localTheme.fontSize = 50
        localTheme.position = CGPoint(x: size.width * 0.25, y: size.height/2)
        
        actionTheme.text = action.randomElement()
        actionTheme.color = .red
        actionTheme.fontSize = 50
        actionTheme.position = CGPoint(x: size.width * 0.75, y: size.height/2)
        
        titleLabel.text = "Local"
        titleLabel.color = .blue
        titleLabel.fontSize = 70
        titleLabel.position = CGPoint(x: size.width * 0.25, y: size.height * 0.75)
        print("passou aq")
        
        backgroundImage = SKSpriteNode(imageNamed: "fundoSorteio")
        backgroundImage.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundImage.zPosition = -1
        backgroundImage.size = size
        
        
        actionTitle.text = "Ação"
        actionTitle.color = .white
        actionTitle.fontSize = 70
        actionTitle.position = CGPoint(x: size.width * 0.75, y: size.height * 0.75)
        
        addChild(localTheme)
        addChild(actionTheme)
        addChild(titleLabel)
        addChild(backgroundImage)
        addChild(actionTitle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
