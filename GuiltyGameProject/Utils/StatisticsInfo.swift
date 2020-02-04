//
//  StatisticsInfo.swift
//  GuiltyGameProject
//
//  Created by Ferraz on 12/12/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation

class StatisticsInfo{
    var words: [String?] = [String]()
    var pinColor: String
    
    init(color: String){
        self.pinColor = color
    }
    
    func addWord(word: String){
        if words.count == 10{
            words.removeFirst()
            words.append(word)
        } else {
            words.append(word)
        }
    }
}
