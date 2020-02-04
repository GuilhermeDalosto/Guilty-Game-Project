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
    
    ///Verificação se está  saindo ou não do jogo
    var isQuitable : Bool {
        
        get {
            return user_default.value(forKey: "isQuitable") as? Bool ?? false
        }
        
        set {
            user_default.set(newValue, forKey: "isQuitable")
        }
        
        
    }
    
    var musicOption : Bool?
    var languageOption : Bool?
    var difficulty : Int?
    var people : Int?
    var theme : Int?
    var typeDeck : Int?
}
