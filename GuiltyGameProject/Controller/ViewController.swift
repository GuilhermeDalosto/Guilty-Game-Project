//
//  ViewController.swift
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 25/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var allWords =  [Word]()
    var allEvents = [Event]()
    var persons = [Person]()
    var teams = [Team]()
    var judge = Judge()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addWords()
        addEvents()
        
        print(allEvents)
        print(allWords)
    }
    
    
    
    
    
    
    func addWords(){
        let words = allWordsSigned()
        for element in words.strAnimal{
            allWords.append(Word("", difficulty: 0, deck: ""))
        }
    }
    
    func addEvents(){
        let events = allEventsSigned()
        for element in  events.events{
            allEvents.append(Event("", difficulty: 0, type: "", duration: 0))
        }
    }
    
    func addJudge(){
        
    }


}

