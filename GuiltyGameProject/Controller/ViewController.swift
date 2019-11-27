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
        addAll()
        
        judge.agree()
        judge.deny()
        judge.endGame()

        for i in allWords{
            print("A palavra da vez é \(i.title)")
        }
        
        for j in allEvents{
            print("O evento da vez é \(j.descriptionEvent)")
        }
        
        
        
    }
    
    func addAll(){
        addWords()
        addEvents()
        addJudge()
    }
    
    
    
    
    
    
    func addWords(){
        let words = allWordsSigned()
        for element in words.strAnimal{
            allWords.append(Word(element, difficulty: 0, deck: element))
        }
    }
    func addEvents(){
        let events = allEventsSigned()
        for element in  events.events{
            allEvents.append(Event(element, difficulty: 0, type: "", duration: 0))
        }
    }
    func addJudge(){
        
    }


}

