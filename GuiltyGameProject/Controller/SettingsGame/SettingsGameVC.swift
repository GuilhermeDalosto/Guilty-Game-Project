//
//  SettingsGameVC.swift
//  GuiltyGameProject
//
//  Created by Igor de Castro on 26/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import UIKit

class SettingsGameViewController: UIViewController {
    
 
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var difficultButton: UIButton!
    @IBOutlet weak var freeButton: UIButton!
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number7: UIButton!
    

    var typeTheme = 0
    var typeDifficulty = 0
    var typeOfPeople = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }

    @IBAction func press3(_ sender: Any) {
        self.number3.backgroundColor = .red
        self.number5.backgroundColor = .gray
        self.number7.backgroundColor = .gray
        typeOfPeople = 3
    }
    
    @IBAction func press5(_ sender: Any) {
        self.number3.backgroundColor = .gray
        self.number5.backgroundColor = .red
        self.number7.backgroundColor = .gray
        typeOfPeople = 5
    }
    
    @IBAction func press7(_ sender: Any) {
        self.number3.backgroundColor = .gray
        self.number5.backgroundColor = .gray
        self.number7.backgroundColor = .red
        typeOfPeople = 7
        
    }
    
    
    @IBAction func pressNormal(_ sender: Any) {
        self.normalButton.backgroundColor = .red
        self.difficultButton.backgroundColor = .gray
        typeDifficulty = 1
    }
    @IBAction func pressDiffitcult(_ sender: Any) {
        self.difficultButton.backgroundColor = .red
        self.normalButton.backgroundColor = .gray
        typeDifficulty = 2
    }
    
    @IBAction func pressFree(_ sender: Any) {
        self.freeButton.backgroundColor = .red
        self.randomButton.backgroundColor = .gray
        typeTheme = 1
    }
    
    @IBAction func pressRandom(_ sender: Any) {
        self.randomButton.backgroundColor = .red
        self.freeButton.backgroundColor = .gray
        typeTheme = 2
    }

    
    @IBAction func pressNext(_ sender: Any) {
        performSegue(withIdentifier: "judge", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ""{
            let theme = typeTheme
            let difficuly = typeDifficulty
            _ = typeOfPeople
            if let vc = segue.destination as? CustomizeJudgeViewController {
                vc.typePeople = theme
                vc.typeDifficulty = difficuly
                vc.typePeople = typeDifficulty
            }
        }
    }
    //perguntar se vai mexer com delegate ou passar as informacoes por storyboard
    
}

