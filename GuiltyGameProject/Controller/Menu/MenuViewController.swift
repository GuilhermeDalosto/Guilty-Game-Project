//
//  MenuViewController.swift
//  GuiltyGameProject
//
//  Created by Igor de Castro on 26/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        startButton.titleLabel?.text = NSLocalizedString("startText", comment: "")
        settingsButton.titleLabel?.text = NSLocalizedString("settingsText", comment: "")
    }
    
    @IBAction func PressStart(_ sender: Any) {
        performSegue(withIdentifier: "SetGame", sender: nil)
    }
    
    @IBAction func PressSettings(_ sender: Any) {
        performSegue(withIdentifier: "Settings", sender: nil)
    }
    
}
