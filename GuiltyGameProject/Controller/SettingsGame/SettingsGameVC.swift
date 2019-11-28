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
    @IBOutlet weak var labelError: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    

    var typeTheme = 0
    var typeDifficulty = 0
    var typeOfPeople = 0
    var numberSelected = false
    var numberDeselected = false
    var difficultySelected = false
    var difficultyDeselected = false
    var themeSelected = false
    var themeDeselected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelError.isHidden = true
        nextButton.isEnabled = true
    }

    @IBAction func press3(_ sender: Any) {
        self.number3.backgroundColor = .red
        self.number5.backgroundColor = .gray
        self.number7.backgroundColor = .gray
        typeOfPeople = 3
        numberSelected = true
        numberDeselected = true
    }
    
    @IBAction func press5(_ sender: Any) {
        self.number3.backgroundColor = .gray
        self.number5.backgroundColor = .red
        self.number7.backgroundColor = .gray
        typeOfPeople = 5
        numberSelected = true
        numberDeselected = true
    }
    
    @IBAction func press7(_ sender: Any) {
        self.number3.backgroundColor = .gray
        self.number5.backgroundColor = .gray
        self.number7.backgroundColor = .red
        typeOfPeople = 7
        numberSelected = true
        numberDeselected = true
    }
    
    
    @IBAction func pressNormal(_ sender: Any) {
        self.normalButton.backgroundColor = .red
        self.difficultButton.backgroundColor = .gray
        typeDifficulty = 1
        difficultySelected = true
    }
    @IBAction func pressDiffitcult(_ sender: Any) {
        self.difficultButton.backgroundColor = .red
        self.normalButton.backgroundColor = .gray
        typeDifficulty = 2
        difficultySelected = true
    }
    
    @IBAction func pressFree(_ sender: Any) {
        self.freeButton.backgroundColor = .red
        self.randomButton.backgroundColor = .gray
        typeTheme = 1
        themeSelected = true
    }
    
    @IBAction func pressRandom(_ sender: Any) {
        self.randomButton.backgroundColor = .red
        self.freeButton.backgroundColor = .gray
        typeTheme = 2
        themeSelected = true
    }

    
    @IBAction func pressNext(_ sender: Any) {
        
        if((numberSelected == false ) || (difficultySelected == false) || (themeSelected == false)){
            self.labelError.isHidden = false
            self.labelError.text = "Alguma(as) das opções não foi(ram) selecionada(s). Selecione alguma das opções!"
            return
        }else {
            UserDefaults.standard.set(typeTheme, forKey: "theme")
            UserDefaults.standard.set(typeOfPeople, forKey: "people")
            UserDefaults.standard.set(typeDifficulty, forKey: "difficulty")
            self.performSegue(withIdentifier: "judge", sender: nil)
        }
       
        
    }
    
    //perguntar se vai mexer com delegate ou passar as informacoes por storyboard
    
}

