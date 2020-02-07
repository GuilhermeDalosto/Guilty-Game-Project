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
    private var focusUnder7 = UIFocusGuide()
    private var focus = UIFocusGuide()
    
    var selectedDifficulty = 0
    var selectedPeople = 0
    var selectedTheme = 0
    
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    
    var fundoPT = UIImage(named: "fundoPT")
    var fundoEN = UIImage(named: "fundoEN")
    
    var nextDes = UIImage(named: "nextSelecionado")
    var nextSel = UIImage(named: "nextSel")
    
    var proximoDes = UIImage(named: "proximoSelecionado")
    var proximoSel = UIImage(named: "proximoSel")
    
    var homeDes = UIImage(named: "homeConfSelecionado")
    var menuDes = UIImage(named: "menuConfSelecionado")
    
    var homeSel = UIImage(named: "homeSel")
    var menuSel  = UIImage(named: "menuSel")
    
    var normalDes = UIImage(named: "normalSelecionado")
    var HardDes = UIImage(named: "hardSelecionado")
    var dificilDes = UIImage(named: "dificilSelecionado")
    
    var normalSel = UIImage(named: "normalSel")
    var hardSel = UIImage(named: "hardSel")
    var dificilSel = UIImage(named: "dificilSel")
    
    
    var a3Des = UIImage(named: "tresSelecionado")
    var a5Des = UIImage(named: "cincoSelecionado")
    var a7Des = UIImage(named: "seteSelecionado")
    
    var a3Sel = UIImage(named: "3Sel")
    var a5Sel = UIImage(named: "5Sel")
    var a7Sel = UIImage(named: "7Sel")
    
    var freeSel = UIImage(named: "freeSel")
    var livreSel = UIImage(named: "livreSel")
    var randomSel = UIImage(named: "randomSel")
    var aleatorioSel = UIImage(named: "aleatorioSel")
    
    var freeDes = UIImage(named: "freeSelecionado")
    var livreDes = UIImage(named: "livreSelecionado")
    var randomDes = UIImage(named: "randomSelecionado")
    var aleatorioDes = UIImage(named: "aleatorioSelecionado")
    
    
    var deckNames = ["Ninja Deck","Food Deck","Magic Deck","Animal Deck","Old West Deck"]
    var imagesSeta = ["direitoSelecionado","setaDireita","setaDireitaSel","setaEsquerda","setaEsquerdaSel","esquerdoSelecionado"]
    
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
    @IBOutlet weak var labelDecks: UILabel!
    @IBOutlet weak var infoImage: UIImageView!
    
    
    var typeTheme = 0
    var typeDifficulty = 0
    var typeOfPeople = 0
    var typeOfDeck = 0
    var numberSelected = false
    var numberDeselected = false
    var difficultySelected = false
    var difficultyDeselected = false
    var themeSelected = false
    var themeDeselected = false
    var language = ""
    var blackScreen: SKSpriteNode?
    var defaults = AllUserDefault()
    
    var imageArrowSelectedRight = UIImage(named: "direitoSelecionado")
    var imageArrowDeselectedRight = UIImage(named: "setaDireita")
    var imageArrowSelectedLeft = UIImage(named: "esquerdoSelecionado")
    var imageArrowDeselectedLeft = UIImage(named: "setaEsquerda")
    
    var arrowViewRight = UIImageView()
    var arrowViewLeft = UIImageView()
    
    let sfx = Sound()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayoutGuide()
        letPressed()
        labelError.isHidden = true
        nextButton.isEnabled = true
        backgroundImage.image = UIImage(named: "")
        self.labelDecks.font = UIFont(name: "MyriadPro-Regular", size: 50)
        self.labelDecks.textColor = UIColor(red: 46/288, green: 4/288, blue: 86/288, alpha: 1.0)
        blackScreen = SKSpriteNode(color: .black, size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        if defaults.screenNumber != 1{
            blackScreen?.zPosition = 10
            defaults.screenNumber = 1
        }else{
            blackScreen?.zPosition = -1
        }
        
        
        arrowViewRight.image = imageArrowSelectedRight
        arrowViewLeft.image = UIImage(named: "")
        
        arrowViewLeft.frame = CGRect(x: UIScreen.main.bounds.width/2 * 1.37, y: UIScreen.main.bounds.height/2 * 0.85, width: 50, height: 50)
        arrowViewRight.frame = CGRect(x: UIScreen.main.bounds.width/2 * 1.88, y: UIScreen.main.bounds.height/2 * 0.85, width: 50, height: 50)
        
        view.addSubview(arrowViewLeft)
        view.addSubview(arrowViewRight)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {

        
        self.backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        
        
        if NSLocalizedString("startText", comment: "") == "Start"{
            language = "EN"
            self.backgroundImage.image = fundoEN
            self.labelDecks.text = "Free"
            infoImage.image = UIImage(named: "infoEN")
        } else{
            language = "PT"
            self.backgroundImage.image = fundoPT
            self.labelDecks.text = "Livre"
            infoImage.image = UIImage(named: "infoPT")
        }
        
        self.view.insertSubview(backgroundImage, at: 0)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.set(selectedDifficulty, forKey: "difficulty")
        UserDefaults.standard.set(selectedPeople, forKey: "numberOfPlayers")
        UserDefaults.standard.set(selectedTheme, forKey: "theme")
        if defaults.screenNumber != 1{
            blackScreen?.zPosition = 100
            defaults.screenNumber = 1
        }
    }
    
    func letPressed(){
        let dif = UserDefaults.standard.integer(forKey: "difficulty")
        let number = UserDefaults.standard.integer(forKey: "numberOfPlayers")
        let theme = UserDefaults.standard.integer(forKey: "theme")
        
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
    
    func escureceTodos(){
        if language == "EN"{
            self.homeButton.setImage(homeDes, for: .normal)
            self.normalButton.setImage(normalDes, for: .normal)
            self.difficultButton.setImage(HardDes, for: .normal)
            self.number3.setImage(a3Des, for: .normal)
            self.number5.setImage(a5Des, for: .normal)
            self.number7.setImage(a7Des, for: .normal)
            self.freeButton.setImage(UIImage(named: "botaozinhoDes"), for: .normal)
            self.randomButton.setImage(randomDes, for: .normal)
            self.nextButton.setImage(nextDes, for: .normal)
        }
        else{
            self.homeButton.setImage(menuDes, for: .normal)
            self.normalButton.setImage(normalDes, for: .normal)
            self.difficultButton.setImage(dificilDes, for: .normal)
            self.number3.setImage(a3Des, for: .normal)
            self.number5.setImage(a5Des, for: .normal)
            self.number7.setImage(a7Des, for: .normal)
            self.freeButton.setImage(UIImage(named: "botaozinhoDes"), for: .normal)
            self.randomButton.setImage(aleatorioDes, for: .normal)
            self.nextButton.setImage(proximoDes, for: .normal)
        }
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        guard let focusedGuideRight = context.nextFocusedView else {return}
        guard let focusedGuideLeft = context.nextFocusedView else {return}
        guard let focusedGuideUp = context.nextFocusedView else {return}
        guard let focusedGuideUpRight = context.nextFocusedView else {return}
        guard let focused = context.nextFocusedView else {return}
        guard let focus7 = context.nextFocusedView else {return}
        sfx.play("PassOption", type: ".wav", repeat: 0)
        escureceTodos()
        
        switch focused{
        case self.normalButton:
            
            self.normalButton.setImage(normalSel, for: .normal)
        case self.difficultButton:
            if language == "PT"{
                          self.difficultButton.setImage(dificilSel, for: .normal)
                       } else{
                           self.difficultButton.setImage(hardSel, for: .normal)
                       }
        case self.number3:
            self.number3.setImage(a3Sel, for: .normal)
        case self.number5:
       self.number5.setImage(a5Sel, for: .normal)
        case self.number7:
            self.number7.setImage(a7Sel, for: .normal)
        case self.freeButton:
            self.freeButton.setImage(UIImage(named: "botaozinho"), for: .normal)
           
        case self.randomButton:
            if language == "PT"{
                           self.randomButton.setImage(aleatorioSel, for: .normal)
                       } else{
                           self.randomButton.setImage(randomSel, for: .normal)
                       }
        case self.nextButton:
            if language == "PT"{
                          self.nextButton.setImage(proximoSel, for: .normal)
                       } else{
                           self.nextButton.setImage(nextSel, for: .normal)
                       }
        default:
            if language == "PT"{
                           self.homeButton.setImage(menuSel, for: .normal)
                       } else{
                            self.homeButton.setImage(homeSel, for: .normal)
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
            
                        
        }
        switch focus7{
        case self.number7:
            self.focusUnder7.preferredFocusedView = self.nextButton
        default:
             self.focusUnder7.preferredFocusedView = nil
            
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
        self.view.addLayoutGuide(focusUnder7)
        
        self.focusUnder7.leftAnchor.constraint(equalTo: self.number7.leftAnchor).isActive = true
        self.focusUnder7.widthAnchor.constraint(equalTo: self.number7.widthAnchor).isActive = true
         self.focusUnder7.heightAnchor.constraint(equalTo: self.number7.heightAnchor).isActive = true
        self.focusUnder7.topAnchor.constraint(equalTo: self.nextButton.topAnchor).isActive = true
        
        
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
        self.number3.backgroundColor = .init(red: 198/288, green: 207/288, blue: 201/288, alpha: 0.4)
        self.number5.backgroundColor = .clear
        self.number7.backgroundColor = .clear
        self.number3.layer.cornerRadius = 10.0
        typeOfPeople = 3
        numberSelected = true
        selectedPeople = 2
    }
    func pressed5(){
        self.number3.backgroundColor = .clear
        self.number5.backgroundColor = .init(red: 198/288, green: 207/288, blue: 201/288, alpha: 0.4)
        self.number7.backgroundColor = .clear
        self.number5.layer.cornerRadius = 10.0
        typeOfPeople = 5
        numberSelected = true
        selectedPeople = 4
    }
    func pressed7(){
        self.number3.backgroundColor = .clear
        self.number5.backgroundColor = .clear
        self.number7.backgroundColor = .init(red: 198/288, green: 207/288, blue: 201/288, alpha: 0.4)
        self.number7.layer.cornerRadius = 10.0
        typeOfPeople = 7
        numberSelected = true
        selectedPeople = 6
    }
    
    func pressedNormal(){
        self.normalButton.backgroundColor = .init(red: 198/288, green: 207/288, blue: 201/288, alpha: 0.4)
        self.difficultButton.backgroundColor = .clear
        self.normalButton.layer.cornerRadius = 10.0
        typeDifficulty = 1
        difficultySelected = true
        selectedDifficulty = 1
    }
    func pressedHard(){
        self.difficultButton.backgroundColor = .init(red: 198/288, green: 207/288, blue: 201/288, alpha: 0.4)
        self.normalButton.backgroundColor = .clear
        self.difficultButton.layer.cornerRadius = 10.0
        typeDifficulty = 2
        difficultySelected = true
        selectedDifficulty = 2
    }
    
    func pressedFree(){
        sfx.play("ChooseOption", type: ".wav", repeat: 0)
        self.freeButton.backgroundColor = .init(red: 198/288, green: 207/288, blue: 201/288, alpha: 0.4)
        self.randomButton.backgroundColor = .clear
        self.freeButton.layer.cornerRadius = 10.0
        typeTheme = 1
        themeSelected = true
        selectedTheme = 1
    }
    
    func pressedRandom(){
        sfx.play("ChooseOption", type: ".wav", repeat: 0)
        self.randomButton.backgroundColor = .init(red: 198/288, green: 207/288, blue: 201/288, alpha: 0.4)
        self.freeButton.backgroundColor = .clear
        self.randomButton.layer.cornerRadius = 10.0
        typeTheme = 2
        themeSelected = true
        selectedTheme = 2
    }
    
    @IBAction func press3(_ sender: Any) {
        sfx.play("ChooseOption", type: ".wav", repeat: 0)
        pressed3()
    }
    
    @IBAction func press5(_ sender: Any) {
        sfx.play("ChooseOption", type: ".wav", repeat: 0)
        pressed5()
    }
    
    @IBAction func press7(_ sender: Any) {
        sfx.play("ChooseOption", type: ".wav", repeat: 0)
        pressed7()
    }
    
    
    @IBAction func pressNormal(_ sender: Any) {
        sfx.play("ChooseOption", type: ".wav", repeat: 0)
        pressedNormal()
    }
    @IBAction func pressDiffitcult(_ sender: Any) {
        sfx.play("ChooseOption", type: ".wav", repeat: 0)
        pressedHard()
    }
    
    var firstLaunch = true
    override weak var preferredFocusedView: UIView? {
        if (self.firstLaunch) {
            self.firstLaunch = false;
            return self.normalButton;
        }  else {
            let view  = super.preferredFocusedView
            return view;
            
        }
    }
    
    @IBAction func pressFree(_ sender: Any) {
        
        if deckNames.count > typeOfDeck{
            self.freeButton.setImage(UIImage(named: "botaozinho"), for: .normal)
            self.labelDecks.text = "\(deckNames[typeOfDeck])"
            self.labelDecks.font = UIFont(name: "MyriadPro-Regular", size: 40)
            self.labelDecks.textColor = UIColor(red: 46/288, green: 4/288, blue: 86/288, alpha: 1.0)
            self.typeOfDeck += 1
            self.arrowViewLeft.image = imageArrowSelectedLeft
            self.arrowViewRight.image = imageArrowSelectedRight
            if typeOfDeck >= deckNames.count {
                self.typeOfDeck = 0
                self.arrowViewRight.image = UIImage(named: "")
            }
        }
        
        pressedFree()
        
    }
    
    @IBAction func pressRandom(_ sender: Any) {
        pressedRandom()
    }
    
    
    @IBAction func pressNext(_ sender: Any) {
        sfx.play("ChooseOption", type: ".wav", repeat: 0)
        if((numberSelected == false ) || (difficultySelected == false) || (themeSelected == false)){
            self.labelError.isHidden = false
            self.labelError.text = NSLocalizedString("errorSelect",comment: "")
            return
        }else {
            UserDefaults.standard.set(typeTheme, forKey: "theme")
            UserDefaults.standard.set(typeOfPeople, forKey: "people")
            UserDefaults.standard.set(typeDifficulty, forKey: "difficulty")
            UserDefaults.standard.set(typeOfDeck, forKey: "deck")
            print(typeOfDeck)
            self.performSegue(withIdentifier: "judge", sender: nil)
        }
        
        
    }
    
    //perguntar se vai mexer com delegate ou passar as informacoes por storyboard
    
    
    
}

