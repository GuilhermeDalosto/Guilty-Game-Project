//
//  SettingsViewController.swift
//  GuiltyGameProject
//
//  Created by Igor de Castro on 26/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    var focusedGuideUp = UIFocusGuide()
    var focusedGuideLeft = UIFocusGuide()
    var focusedGuideLeftDown = UIFocusGuide()
    
    
    var musicOption = true
    var musicOptionStr = "On"
    
    var languageOption = true
    var languageOptionStr = "EN"
    
    @IBOutlet weak var musicButton: UIButton!
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var languageButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        setLayoutGuide()
        
        musicOption = UserDefaults.standard.bool(forKey: "musicOption")
        languageOption = UserDefaults.standard.bool(forKey: "languageOption")
        
        if musicOption{
            musicOptionStr = "On"
            musicButton.setImage(UIImage(named: "musicOn"), for: .normal)
        }else{
            musicOptionStr = "Off"
            musicButton.setImage(UIImage(named: "musicOff"), for: .normal)
        }
        
        if languageOption{
            languageOptionStr = "EN"
            
        }
        else{
            languageOptionStr = "BR"
        }
        self.homeButton.setTitle("\(NSLocalizedString("homeText", comment: ""))", for: .normal)
        self.languageButton.setTitle("\(NSLocalizedString("languageText",comment: ""))                \(languageOptionStr)", for: .normal)
        self.musicButton.setTitle("\(NSLocalizedString("musicText",comment: ""))                \(musicOptionStr)", for: .normal)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.set(musicOption, forKey: "musicOption")
        UserDefaults.standard.set(languageOption, forKey: "languageOption")
    }
    
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        guard let focusedGuideUp = context.nextFocusedView else {return}
        guard let focusedGuideLeft = context.nextFocusedView else {return}
        guard let focusedGuideLeftDown = context.nextFocusedView else {return}
        
        switch focusedGuideUp{
        case self.musicButton:            
            self.focusedGuideUp.preferredFocusedView = self.homeButton
            
        case self.homeButton:
            self.focusedGuideUp.preferredFocusedView = self.musicButton

        default:
            self.focusedGuideUp.preferredFocusedView = nil
        }
        
        switch focusedGuideLeft {
        case self.homeButton:
            self.focusedGuideLeft.preferredFocusedView = self.musicButton
        case self.languageButton:
            self.focusedGuideLeft.preferredFocusedView = self.homeButton
        case self.musicButton:
            self.focusedGuideLeft.preferredFocusedView  = self.homeButton
        default:
            self.focusedGuideLeft.preferredFocusedView = nil
        }
        
        switch focusedGuideLeftDown{
        case self.homeButton:
            self.focusedGuideLeftDown.preferredFocusedView = self.musicButton
        case self.languageButton:
            self.focusedGuideLeftDown.preferredFocusedView = self.homeButton
        case self.musicButton:
            self.focusedGuideLeftDown.preferredFocusedView = self.homeButton
        default:
            self.focusedGuideLeft.preferredFocusedView = nil
        }
        
    }
    
    func setLayoutGuide(){
        self.view.addLayoutGuide(focusedGuideUp)
        self.view.addLayoutGuide(focusedGuideLeft)
        self.view.addLayoutGuide(focusedGuideLeftDown)
        
        self.focusedGuideUp.leftAnchor.constraint(equalTo: self.musicButton.leftAnchor).isActive = true
        self.focusedGuideUp.widthAnchor.constraint(equalTo: self.musicButton.widthAnchor).isActive = true
        
        self.focusedGuideUp.heightAnchor.constraint(equalTo: self.homeButton.heightAnchor).isActive = true
        self.focusedGuideUp.topAnchor.constraint(equalTo: self.homeButton.topAnchor).isActive = true
        
        self.focusedGuideLeft.rightAnchor.constraint(equalTo: self.homeButton.rightAnchor).isActive = true
        self.focusedGuideLeft.widthAnchor.constraint(equalTo: self.homeButton.widthAnchor).isActive = true
        
        self.focusedGuideLeft.heightAnchor.constraint(equalTo: self.musicButton.heightAnchor).isActive = true
        self.focusedGuideLeft.topAnchor.constraint(equalTo: self.musicButton.topAnchor).isActive = true
        
        self.focusedGuideLeftDown.rightAnchor.constraint(equalTo: self.homeButton.rightAnchor).isActive = true
        self.focusedGuideLeftDown.widthAnchor.constraint(equalTo: self.homeButton.widthAnchor).isActive = true
              
        self.focusedGuideLeftDown.heightAnchor.constraint(equalTo: self.musicButton.heightAnchor).isActive = true
        self.focusedGuideLeftDown.topAnchor.constraint(equalTo: self.languageButton.topAnchor).isActive = true
              
        
        
        
    }
    
    
    @IBAction func PressHome(_ sender: Any) {
        performSegue(withIdentifier: "Main", sender: nil)
    
    }
    
    @IBAction func pressMusicButton(_ sender: Any) {
        
        musicOption.toggle()
        
        if musicOption{
            musicOptionStr = "On"
            musicButton.setImage(UIImage(named: "musicOn"), for: .normal)
        }else{
            musicOptionStr = "Off"
            musicButton.setImage(UIImage(named: "musicOff"), for: .normal)
        }
        
        print(musicOption)
        self.musicButton.setTitle("\(NSLocalizedString("musicText",comment:""))                \(musicOptionStr)", for: .normal)
        
    }
    
    @IBAction func pressLanguageButton(_ sender: Any) {
        languageOption.toggle()
        
        if languageOption{
            languageOptionStr = "EN"
            languageButton.setImage(UIImage(named: "IdiomaEN"), for: .normal)
        }else{
            languageOptionStr = "BR"
            languageButton.setImage(UIImage(named: "IdiomaPT"), for: .normal)
        }
        
        self.languageButton.setTitle("\(NSLocalizedString("languageText", comment: ""))                \(languageOptionStr)", for: .normal)
    }

    
}
