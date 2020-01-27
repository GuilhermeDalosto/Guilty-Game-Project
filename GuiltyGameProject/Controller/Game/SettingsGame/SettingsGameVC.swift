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
    private var focus = UIFocusGuide()
    
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
        
        
        
        
        
        
//        self.homeButton.setTitle(NSLocalizedString("homeText", comment: ""), for: .normal)
//        self.normalButton.setTitle(NSLocalizedString("normalText", comment: ""), for: .normal)
//        self.difficultButton.setTitle(NSLocalizedString("hardText", comment: ""), for: .normal)
//
//        self.number3.setTitle(NSLocalizedString("number3", comment: ""), for: .normal)
//        self.number5.setTitle(NSLocalizedString("number5", comment: ""), for: .normal)
//        self.number7.setTitle(NSLocalizedString("number7", comment: ""), for: .normal)
//
//        self.freeButton.setTitle(NSLocalizedString("freeText", comment: ""), for: .normal)
//        self.randomButton.setTitle(NSLocalizedString("randomText", comment: ""), for: .normal)
//
//        self.nextButton.setTitle(NSLocalizedString("nextText", comment: ""), for: .normal)
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.set(selectedDifficulty, forKey: "difficulty")
        UserDefaults.standard.set(selectedPeople, forKey: "numberOfPlayers")
        UserDefaults.standard.set(selectedTheme, forKey: "theme")
    }
    
    func letPressed(){
        let dif = UserDefaults.standard.integer(forKey: "difficulty")
        let number = UserDefaults.standard.integer(forKey: "numberOfPlayers")
        let theme = UserDefaults.standard.integer(forKey: "theme")
        
        print(dif)
        print(number)
        print(theme)
        
        switch number{
        case 2:
            pressed3()
        case 4:
            pressed5()
        case 6:
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
        guard let focused = context.nextFocusedView else {return}
        
        
        switch focused{
        case self.normalButton:
            UIView.animate(withDuration: 0.3) {
                self.normalButton.frame.size.width += 30
                self.normalButton.frame.size.height += 30
            }
        case self.difficultButton:
            UIView.animate(withDuration: 0.3) {
                self.difficultButton.frame.size.width += 30
                self.difficultButton.frame.size.height += 30
            }
        case self.number3:
            UIView.animate(withDuration: 0.3) {
                self.number3.frame.size.width += 30
                self.number3.frame.size.height += 30
            }
        case self.number5:
            UIView.animate(withDuration: 0.3) {
                self.number5.frame.size.width += 30
                self.number5.frame.size.height += 30
            }
        case self.number7:
            UIView.animate(withDuration: 0.3) {
                self.number7.frame.size.width += 30
                self.number7.frame.size.height += 30
            }
        case self.freeButton:
            UIView.animate(withDuration: 0.3) {
                self.freeButton.frame.size.width += 30
                self.freeButton.frame.size.height += 30
            }
        case self.randomButton:
            UIView.animate(withDuration: 0.3) {
                self.randomButton.frame.size.width += 30
                self.randomButton.frame.size.height += 30
            }
        case self.nextButton:
            UIView.animate(withDuration: 0.3) {
                self.nextButton.frame.size.width += 30
                self.nextButton
                    .frame.size.height += 30
            }
        default:
            UIView.animate(withDuration: 0.3) {
                self.homeButton.frame.size.width += 30
                self.homeButton.frame.size.height += 30
            }
            
        }
        
        if normalButton.frame.size.width > 410 && focused != self.normalButton {
            UIView.animate(withDuration: 0.3) {
                self.normalButton.frame.size.height -= 30
                self.normalButton.frame.size.width -= 30
            }
        }
        
        if difficultButton.frame.size.width > 410 && focused != self.difficultButton{
            UIView.animate(withDuration: 0.3) {
                self.difficultButton.frame.size.height -= 30
                self.difficultButton.frame.size.width -= 30
            }
        }
        
     if number3.frame.size.width > 410 && focused != self.number3 {
              UIView.animate(withDuration: 0.3) {
                  self.number3.frame.size.height -= 30
                  self.number3.frame.size.width -= 30
              }
          }
        
        if number5.frame.size.width > 410 && focused != self.number5 {
                     UIView.animate(withDuration: 0.3) {
                         self.number5.frame.size.height -= 30
                         self.number5.frame.size.width -= 30
                     }
                 }
        
        if number7.frame.size.width > 410 && focused != self.number7 {
                     UIView.animate(withDuration: 0.3) {
                         self.number7.frame.size.height -= 30
                         self.number7.frame.size.width -= 30
                     }
                 }
        
        if freeButton.frame.size.width > 410 && focused != self.freeButton {
                     UIView.animate(withDuration: 0.3) {
                         self.freeButton.frame.size.height -= 30
                         self.freeButton.frame.size.width -= 30
                     }
                 }
        
        if randomButton.frame.size.width > 410 && focused != self.randomButton {
                     UIView.animate(withDuration: 0.3) {
                         self.randomButton.frame.size.height -= 30
                         self.randomButton.frame.size.width -= 30
                     }
                 }
        
        if nextButton.frame.size.width > 260 && focused != self.nextButton {
                     UIView.animate(withDuration: 0.3) {
                         self.nextButton.frame.size.height -= 30
                         self.nextButton.frame.size.width -= 30
                     }
                 }
        
        if homeButton.frame.size.width > 260 && focused != self.homeButton {
                     UIView.animate(withDuration: 0.3) {
                         self.homeButton.frame.size.height -= 30
                         self.homeButton.frame.size.width -= 30
                     }
                 }
        
        
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
        self.number3.backgroundColor = .init(red: 1, green: 0, blue: 0, alpha: 0.4)
        self.number5.backgroundColor = .clear
        self.number7.backgroundColor = .clear
        typeOfPeople = 3
        numberSelected = true
        selectedPeople = 2
    }
    func pressed5(){
        self.number3.backgroundColor = .clear
        self.number5.backgroundColor = .init(red: 1, green: 0, blue: 0, alpha: 0.4)
        self.number7.backgroundColor = .clear
        typeOfPeople = 5
        numberSelected = true
        selectedPeople = 4
    }
    func pressed7(){
        self.number3.backgroundColor = .clear
        self.number5.backgroundColor = .clear
        self.number7.backgroundColor = .init(red: 1, green: 0, blue: 0, alpha: 0.4)
        typeOfPeople = 7
        numberSelected = true
        selectedPeople = 6
    }
    
    func pressedNormal(){
        self.normalButton.backgroundColor = .init(red: 1, green: 0, blue: 0, alpha: 0.4)
        self.difficultButton.backgroundColor = .clear
        typeDifficulty = 1
        difficultySelected = true
        selectedDifficulty = 1
    }
    func pressedHard(){
        self.difficultButton.backgroundColor = .init(red: 1, green: 0, blue: 0, alpha: 0.4)
        self.normalButton.backgroundColor = .clear
        typeDifficulty = 2
        difficultySelected = true
        selectedDifficulty = 2
    }
    
    func pressedFree(){
        self.freeButton.backgroundColor = .init(red: 1, green: 0, blue: 0, alpha: 0.4)
        self.randomButton.backgroundColor = .clear
        typeTheme = 1
        themeSelected = true
        selectedTheme = 1
    }
    
    func pressedRandom(){
        self.randomButton.backgroundColor = .init(red: 1, green: 0, blue: 0, alpha: 0.4)
        self.freeButton.backgroundColor = .clear
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

