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
    
    override func viewWillAppear(_ animated: Bool) {        
        startButton.setTitle(NSLocalizedString("startText", comment: ""), for: .normal)
        settingsButton.setTitle(NSLocalizedString("settingsText", comment: ""), for: .normal)
    }
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        guard let focusedView = context.nextFocusedView else {return}
        
        switch focusedView{
        case startButton:
            startButton.backgroundColor = .brown
            settingsButton.backgroundColor = .clear
        case settingsButton:
            settingsButton.backgroundColor = .brown
            startButton.backgroundColor = .clear
        default:
            print("a")
        }
    }
    
    @IBAction func PressStart(_ sender: Any) {
        performSegue(withIdentifier: "SetGame", sender: nil)
    }
    
    @IBAction func PressSettings(_ sender: Any) {
        performSegue(withIdentifier: "Settings", sender: nil)
    }
    
}

extension SiriRemote{
    
}
