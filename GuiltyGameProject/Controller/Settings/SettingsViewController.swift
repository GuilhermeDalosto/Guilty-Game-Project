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
    
    var musicOption = true
    var musicOptionStr = "On"
    
    var languageOption = true
    var languageOptionStr = "EN"
    
    @IBOutlet weak var musicButton: UIButton!
    
    @IBOutlet weak var languageButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        musicOption = UserDefaults.standard.bool(forKey: "musicOption")
        languageOption = UserDefaults.standard.bool(forKey: "languageOption")
        
        if musicOption{
            musicOptionStr = "On"
        }else{
            musicOptionStr = "Off"
        }
        
        if languageOption{
            languageOptionStr = "EN"
        }
        else{
            languageOptionStr = "BR"
        }
        
        self.languageButton.setTitle("Language                \(languageOptionStr)", for: .normal)
        self.musicButton.setTitle("Music                \(musicOptionStr)", for: .normal)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.set(musicOption, forKey: "musicOption")
        UserDefaults.standard.set(languageOption, forKey: "languageOption")
    }
    
    @IBAction func PressHome(_ sender: Any) {
        performSegue(withIdentifier: "Main", sender: nil)
    }
    
    @IBAction func pressMusicButton(_ sender: Any) {
        
        musicOption.toggle()
        
        if musicOption{
            musicOptionStr = "On"
        }else{
            musicOptionStr = "Off"
        }
        
        print(musicOption)
        self.musicButton.setTitle("Music                \(musicOptionStr)", for: .normal)
    }
    
    @IBAction func pressLanguageButton(_ sender: Any) {
        languageOption.toggle()
        
        if languageOption{
            languageOptionStr = "EN"
        }else{
            languageOptionStr = "BR"
        }
        
        self.languageButton.setTitle("Language                \(languageOptionStr)", for: .normal)
    }

    
}
