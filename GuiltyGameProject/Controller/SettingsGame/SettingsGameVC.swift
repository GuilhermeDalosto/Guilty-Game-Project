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
    
    private var focusGuideRight = UIFocusGuide()
    private var focusGuideLeft = UIFocusGuide()
    private var focusGuideUp = UIFocusGuide()
    private var focusGuideUpRight = UIFocusGuide()
    
    var selectedDifficulty = 0
    var selectedPeople = 0
    var selectedTheme = 0
    
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var difficultButton: UIButton!
    @IBOutlet weak var freeButton: UIButton!
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var labelError: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var difficultLabel: UILabel!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    
    
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
        setLayoutGuide()
        letPressed()
        labelError.isHidden = true
        nextButton.isEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.difficultLabel.text = NSLocalizedString("difficultText", comment: "")
        self.peopleLabel.text = NSLocalizedString("peopleText", comment: "")
        self.themeLabel.text = NSLocalizedString("themeText", comment: "")
        
        
        
        
        self.homeButton.setTitle(NSLocalizedString("homeText", comment: ""), for: .normal)
        self.normalButton.setTitle(NSLocalizedString("normalText", comment: ""), for: .normal)
        self.difficultButton.setTitle(NSLocalizedString("hardText", comment: ""), for: .normal)
        
        self.number3.setTitle(NSLocalizedString("number3", comment: ""), for: .normal)
        self.number5.setTitle(NSLocalizedString("number5", comment: ""), for: .normal)
        self.number7.setTitle(NSLocalizedString("number7", comment: ""), for: .normal)
        
        self.freeButton.setTitle(NSLocalizedString("freeText", comment: ""), for: .normal)
        self.randomButton.setTitle(NSLocalizedString("randomText", comment: ""), for: .normal)
        
        self.nextButton.setTitle(NSLocalizedString("nextText", comment: ""), for: .normal)
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.set(selectedDifficulty, forKey: "difficulty")
        UserDefaults.standard.set(selectedPeople, forKey: "people")
        UserDefaults.standard.set(selectedTheme, forKey: "theme")
    }
    
    func letPressed(){
        let dif = UserDefaults.standard.integer(forKey: "difficulty")
        let number = UserDefaults.standard.integer(forKey: "people")
        let theme = UserDefaults.standard.integer(forKey: "theme")
        
        print(dif)
        print(number)
        print(theme)
        
        switch number{
        case 1:
            pressed3()
        case 2:
            pressed5()
        case 3:
            pressed7()
        default:
            print()
        }
        
        switch dif{
        case 1:
            pressedNormal()
        case 2:
            pressedHard()
        default:
            print()
        }
        
        switch theme{
        case 1:
            pressedFree()
        case 2:
            pressedRandom()
        default:
            print()
        }
    
        
        
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        guard let focusedGuideRight = context.nextFocusedView else {return}
        guard let focusedGuideLeft = context.nextFocusedView else {return}
        guard let focusedGuideUp = context.nextFocusedView else {return}
        guard let focusedGuideUpRight = context.nextFocusedView else {return}
        
        switch focusedGuideRight{
        case self.randomButton:
            self.focusGuideRight.preferredFocusedView = self.nextButton
        case self.nextButton:
            self.focusGuideRight.preferredFocusedView = self.randomButton
        default:
            self.focusGuideRight.preferredFocusedView = nil
        }
        
        switch focusedGuideLeft {
        case self.difficultButton:
            self.focusGuideLeft.preferredFocusedView = self.nextButton
        case self.nextButton:
            self.focusGuideLeft.preferredFocusedView = self.difficultButton
        default:
            self.focusGuideLeft.preferredFocusedView = nil
        }
        
        switch focusedGuideUp {
        case self.number3:
            self.focusGuideLeft.preferredFocusedView = self.homeButton
        case self.freeButton:
            self.focusGuideLeft.preferredFocusedView = self.nextButton
        case self.homeButton:
            self.focusGuideLeft.preferredFocusedView = self.normalButton
        default:
            self.focusGuideLeft.preferredFocusedView = self.nextButton
            
            
            print(focusedGuideUp)
        }
        
        switch focusedGuideUpRight {
        case self.number3:
            self.focusGuideUpRight.preferredFocusedView = self.homeButton
        default:
            self.focusGuideUpRight.preferredFocusedView = self.homeButton
        }
        
        
        
        
    }
    
    func setLayoutGuide(){
        self.view.addLayoutGuide(focusGuideRight)
        self.view.addLayoutGuide(focusGuideLeft)
        self.view.addLayoutGuide(focusGuideUp)
        self.view.addLayoutGuide(focusGuideUpRight)
        
        self.focusGuideRight.leftAnchor.constraint(equalTo: self.randomButton.leftAnchor).isActive = true
        self.focusGuideRight.widthAnchor.constraint(equalTo: self.randomButton.widthAnchor).isActive = true
        
        self.focusGuideRight.heightAnchor.constraint(equalTo: self.nextButton.heightAnchor).isActive = true
        self.focusGuideRight.topAnchor.constraint(equalTo: self.nextButton.topAnchor).isActive = true
        
        self.focusGuideLeft.rightAnchor.constraint(equalTo: self.difficultButton.rightAnchor).isActive = true
        self.focusGuideLeft.widthAnchor.constraint(equalTo: self.difficultButton.widthAnchor).isActive = true
        
        self.focusGuideLeft.heightAnchor.constraint(equalTo: self.nextButton.heightAnchor).isActive = true
        self.focusGuideLeft.topAnchor.constraint(equalTo: self.nextButton.topAnchor).isActive = true
        
        self.focusGuideUp.rightAnchor.constraint(equalTo: self.number3.rightAnchor).isActive = true
        self.focusGuideUp.widthAnchor.constraint(equalTo: self.number3.widthAnchor).isActive = true
        
        self.focusGuideUp.heightAnchor.constraint(equalTo: self.homeButton.heightAnchor).isActive = true
        self.focusGuideUp.topAnchor.constraint(equalTo: self.homeButton.topAnchor).isActive = true
        
        self.focusGuideUpRight.rightAnchor.constraint(equalTo: self.freeButton.rightAnchor).isActive = true
        self.focusGuideUpRight.widthAnchor.constraint(equalTo: self.freeButton.widthAnchor).isActive = true
        
        self.focusGuideUpRight.heightAnchor.constraint(equalTo: self.homeButton.heightAnchor).isActive = true
        self.focusGuideUpRight.topAnchor.constraint(equalTo: self.homeButton.topAnchor).isActive = true
        
        
        
    }
    
    func pressed3(){
        self.number3.backgroundColor = .red
           self.number5.backgroundColor = .gray
           self.number7.backgroundColor = .gray
           typeOfPeople = 3
           numberSelected = true
            selectedPeople = 1
    }
    func pressed5(){
        self.number3.backgroundColor = .gray
        self.number5.backgroundColor = .red
        self.number7.backgroundColor = .gray
        typeOfPeople = 5
        numberSelected = true
        selectedPeople = 2
    }
    func pressed7(){
        self.number3.backgroundColor = .gray
               self.number5.backgroundColor = .gray
               self.number7.backgroundColor = .red
               typeOfPeople = 7
               numberSelected = true
        selectedPeople = 3
    }
    
    func pressedNormal(){
        self.normalButton.backgroundColor = .red
               self.difficultButton.backgroundColor = .gray
               typeDifficulty = 1
               difficultySelected = true
        selectedDifficulty = 1
    }
    func pressedHard(){
        self.difficultButton.backgroundColor = .red
        self.normalButton.backgroundColor = .gray
        typeDifficulty = 2
        difficultySelected = true
        selectedDifficulty = 2
    }
    
    func pressedFree(){
        self.freeButton.backgroundColor = .red
        self.randomButton.backgroundColor = .gray
        typeTheme = 1
        themeSelected = true
        selectedTheme = 1
    }
    
    func pressedRandom(){
        self.randomButton.backgroundColor = .red
        self.freeButton.backgroundColor = .gray
        typeTheme = 2
        themeSelected = true
        selectedTheme = 2
    }
    
    @IBAction func press3(_ sender: Any) {
        pressed3()
    }
    
    @IBAction func press5(_ sender: Any) {
        pressed5()
    }
    
    @IBAction func press7(_ sender: Any) {
       pressed7()
    }
    
    
    @IBAction func pressNormal(_ sender: Any) {
       pressedNormal()
    }
    @IBAction func pressDiffitcult(_ sender: Any) {
        pressedHard()
    }
    
    @IBAction func pressFree(_ sender: Any) {
        pressedFree()
    }
    
    @IBAction func pressRandom(_ sender: Any) {
        pressedRandom()
    }
    
    
    @IBAction func pressNext(_ sender: Any) {
        
        if((numberSelected == false ) || (difficultySelected == false) || (themeSelected == false)){
            self.labelError.isHidden = false
            self.labelError.text = NSLocalizedString("errorSelect",comment: "")
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

