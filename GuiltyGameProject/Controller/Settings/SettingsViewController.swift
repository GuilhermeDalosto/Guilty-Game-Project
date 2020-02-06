//
//  SettingsViewController.swift
//  GuiltyGameProject
//
//  Created by Igor de Castro on 26/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class SettingsViewController: UIViewController {
    
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    var olhandoCima = UIImage(named: "telaMusica")
    var olhandoBaixo = UIImage(named: "telaIdioma")
    
    let music2 = Sound()
    var homeDes = UIImage(named: "homeConf")
     var menuDes = UIImage(named: "menuConf")
    
//    var homeDes = UIImage(named: "homeConfSelecionado")
//    var menuDes = UIImage(named: "menuConfSelecionado")
    
    
//    var musicaOffDes = UIImage(named: "musicaOffSelecionado")
//    var musicaOnDes = UIImage(named: "musicaOnSelecionado")
//
//    var musicOffDes = UIImage(named: "musicOffSelecionado")
//    var musicOnDes = UIImage(named: "musicOnSelecionado")
    
    var musicaOffDes = UIImage(named: "musicaOff")
     var musicaOnDes = UIImage(named: "musicaOn")
     
     var musicOffDes = UIImage(named: "musicOff")
     var musicOnDes = UIImage(named: "musicOn")
    
    
    var homeSel = UIImage(named: "homeConf")
    var menuSel = UIImage(named: "menuConf")
    
    var musicaOnSel = UIImage(named: "musicaOn")
    var musicaOffSel = UIImage(named: "musicaOff")
    
    var musicOnSel = UIImage(named: "musicOn")
    var musicOffSel = UIImage(named: "musicOff")
    
    
    var focusedGuideUp = UIFocusGuide()
    var focusedGuideLeft = UIFocusGuide()
    var focusedGuideLeftDown = UIFocusGuide()    
    
    var musicOption = true
    var musicOptionStr = "On"
    var language = ""
    var languageOption = true
    var languageOptionStr = "EN"
    var music = AVAudioPlayer()
    var sound = Sound()
    @IBOutlet weak var musicButton: UIButton!
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var languageButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        backgroundImage.image = UIImage(named: "telaIdioma")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        setLayoutGuide()
        
        musicOption = UserDefaults.standard.bool(forKey: "musicOption")
        languageOption = UserDefaults.standard.bool(forKey: "languageOption")

        if languageOption{
            languageOptionStr = "EN"
        }
        else{
            languageOptionStr = "BR"
        }
        
        if NSLocalizedString("homeText", comment: "") == "Home"{
            language = "EN"
            self.homeButton.setImage(homeSel, for: .normal)
            
            if musicOption{
                self.musicButton.setImage(musicOnSel, for: .normal)
            } else{
                self.musicButton.setImage(musicOffSel, for: .normal)
            }
        } else{
            language = "PT"
            self.homeButton.setImage(menuSel, for: .normal)
            if musicOption {
                self.musicButton.setImage(musicaOnSel, for: .normal)
            } else{
                self.musicButton.setImage(musicaOffSel, for: .normal)
            }
        }
        
        
        
    }
    var firstLaunch = true
    override weak var preferredFocusedView: UIView? {
        if (self.firstLaunch) {
            self.firstLaunch = false;
            return self.musicButton;
        }  else {
            let view  = super.preferredFocusedView
            return view;
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.set(musicOption, forKey: "musicOption")
        UserDefaults.standard.set(languageOption, forKey: "languageOption")
    }
    
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        guard let focusedGuideUp = context.nextFocusedView else {return}
        guard let focusedGuideLeft = context.nextFocusedView else {return}
        guard let focusedGuideLeftDown = context.nextFocusedView else {return}
        guard let focus = context.nextFocusedView else {return}
        
        switch focus{
        case self.musicButton:
            self.backgroundImage.image = olhandoBaixo
            if language == "PT"{
                
                self.homeButton.setImage(menuDes, for: .normal)
                if musicOption{
                    self.musicButton.setImage(musicaOnSel, for: .normal)
                } else{
                     self.musicButton.setImage(musicaOffSel, for: .normal)
                
            }
            }
            else{
                
                self.homeButton.setImage(homeDes, for: .normal)
                    if musicOption{
                         self.musicButton.setImage(musicOnSel, for: .normal)
                    } else{
                         self.musicButton.setImage(musicOffSel, for: .normal)
                                        
                }
                
            }
        default:
            self.backgroundImage.image = olhandoCima
            if language == "PT"{
                self.homeButton.setImage(menuSel, for: .normal)
                if musicOption{
                    self.musicButton.setImage(musicaOnDes, for: .normal)
                } else{
                     self.musicButton.setImage(musicaOffDes, for: .normal)
                }
            } else{
                self.homeButton.setImage(homeSel, for: .normal)
                if musicOption{
                     self.musicButton.setImage(musicOnDes, for: .normal)
                } else{
                     self.musicButton.setImage(musicOffDes, for: .normal)
                }
            }
        }
            
        
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
    
    @IBAction func onboard(_ sender: UIButton) {
        performSegue(withIdentifier: "onBoard", sender: nil)
    }
    
    
    
    
    @IBAction func PressHome(_ sender: Any) {
        performSegue(withIdentifier: "Main", sender: nil)
        
    }
    
    @IBAction func pressMusicButton(_ sender: Any) {
        
        musicOption.toggle()
      
        
        if language == "EN"{
            if musicOption{
                musicOptionStr = "On"
                musicButton.setImage(UIImage(named: "musicOn"), for: .normal)
                music.play()
                
            }else{
                musicOptionStr = "Off"
                musicButton.setImage(UIImage(named: "musicOff"), for: .normal)
                music.pause()
            }
        } else{
            if musicOption{
                musicOptionStr = "On"
                musicButton.setImage(UIImage(named: "musicaOn"), for: .normal)
                music.play()
            }else{
                musicOptionStr = "Off"
                musicButton.setImage(UIImage(named: "musicaOff"), for: .normal)
                music.pause()

            }
        }
        

        
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
