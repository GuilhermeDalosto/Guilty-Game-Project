//
//  StatisticsInfo.swift
//  GuiltyGameProject
//
//  Created by Ferraz on 12/12/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation

class StatisticsInfo{
    var round: Int
    var word: String
    var event: String
    var pinColor: String
    var accepted: Bool = true
    
    init(word: String, event: String, color: String, round: Int){
        self.word = word
        self.event = event
        self.pinColor = color
        self.round = round
    }
    
    init(word: String, color: String, round: Int){
        self.word = word
        self.event = ""
        self.pinColor = color
        self.round = round
    }
    
    func notAccepted(){
        self.accepted = false
    }
}
