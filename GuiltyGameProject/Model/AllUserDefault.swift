//
//  AllUserDefault.swift
//  GuiltyGameProject
//
//  Created by Victor Dângelo Teixeira Ciccarini on 02/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation

class AllUserDefault {

    private let user_default = UserDefaults.standard

    ///Verificação se está no jogo ou não
    var isOnGame : Bool {
        
        get {
            return user_default.value(forKey: "isOnGame") as? Bool ?? false
        }
        
        set {
            user_default.set(newValue, forKey: "isOnGame")
        }
        
        
    }
    
    ///Verificação se está no jogo ou não
    var isPaused : Bool {
        
        get {
            return user_default.value(forKey: "isPaused") as? Bool ?? false
        }
        
        set {
            user_default.set(newValue, forKey: "isPaused")
        }
        
        
    }
    
    ///Verificação se está saindo ou não do jogo
    var isQuitable : Bool {
        
        get {
            return user_default.value(forKey: "isQuitable") as? Bool ?? false
        }
        
        set {
            user_default.set(newValue, forKey: "isQuitable")
        }
        
        
    }
    
    ///Verificação para saber em qual tela, dentro do jogo, ele está
    var positionOnTheGameScreen : Int {
        
        get {
            return user_default.value(forKey: "positionOnTheGameScreen") as? Int ?? 1
        }
        
        set {
            user_default.set(newValue, forKey: "positionOnTheGameScreen")
        }
        
        
    }
    
    ///Verificação para saber em qual conjunto de telas do fluxo ela está
    var screenNumber : Int {
        
        get {
            return user_default.value(forKey: "screenNumber") as? Int ?? 1
        }
        
        set {
            user_default.set(newValue, forKey: "screenNumber")
        }
        
        
    }
    
    var firstLaunch : Bool {
        
        get {
            return user_default.value(forKey: "firstLaunch") as? Bool ?? false
        }
        set {
            user_default.set(newValue, forKey: "firstLaunch")
        }
    }
    
//    var qtPlayer = UserDefaults.standard.integer(forKey: "numberOfPlayers")
    
    var musicOption : Bool?
    var languageOption : Bool?
    var difficulty : Int?
    var people : Int?
    var theme : Int?
    var typeDeck : Int?
}
