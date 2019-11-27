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
    
    
    @IBOutlet weak var musicButton: UIButton!
    
    @IBOutlet weak var languageButton: UIButton!
    
    @IBAction func PressHome(_ sender: Any) {
        performSegue(withIdentifier: "Main", sender: nil)
    }
    
    @IBAction func pressMusicButton(_ sender: Any) {
        self.musicButton.setTitle("Music             On", for: .normal)
    }
    
    @IBAction func pressLanguageButton(_ sender: Any) {
        self.languageButton.setTitle("EN", for: .normal)
    }
    
    
}
