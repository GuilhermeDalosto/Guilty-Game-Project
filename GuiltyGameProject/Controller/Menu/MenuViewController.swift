//
//  MenuViewController.swift
//  GuiltyGameProject
//
//  Created by Igor de Castro on 26/11/19.
//  Copyright © 1519 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import UIKit
import StoreKit

class MenuViewController: UIViewController {
    
    
    @IBOutlet weak var shopButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    private var focusGuideSelected = UIFocusGuide()
    
    
    override func viewWillAppear(_ animated: Bool) {        
        //  startButton.setTitle(NSLocalizedString("startText", comment: ""), for: .normal)
        //  settingsButton.setTitle(NSLocalizedString("settingsText", comment: ""), for: .normal)
    }
    
    @IBAction func PressStart(_ sender: Any) {
        performSegue(withIdentifier: "SetGame", sender: nil)
    }
    
    @IBAction func PressSettings(_ sender: Any) {
        performSegue(withIdentifier: "Settings", sender: nil)
    }
    
    
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        guard let focus = context.nextFocusedView else {return}
        
        switch focus{
        case self.startButton:
            UIView.animate(withDuration: 0.3) {
                self.startButton.frame.size.height += 15
                self.startButton.frame.size.width += 15
            }
        case self.settingsButton:
            UIView.animate(withDuration: 0.3) {
                self.settingsButton.frame.size.height += 15
                self.settingsButton.frame.size.width += 15
            }
        default:
            UIView.animate(withDuration: 0.3) {
                self.shopButton.frame.size.height += 15
                self.shopButton.frame.size.width += 15
            }
            
        }
        
        if startButton.frame.size.width > 350 && focus != self.startButton {
            UIView.animate(withDuration: 0.3) {
                self.startButton.frame.size.height -= 15
                self.startButton.frame.size.width -= 15
            }
        }
        
        if settingsButton.frame.size.width > 350 && focus != self.settingsButton{
            UIView.animate(withDuration: 0.3) {
                self.settingsButton.frame.size.height -= 15
                self.settingsButton.frame.size.width -= 15
            }
        }
        
        if shopButton.frame.size.width > 250 && focus != self.shopButton {
            UIView.animate(withDuration: 0.3) {
                self.shopButton.frame.size.height -= 15
                self.shopButton.frame.size.width -= 15
            }
        }
        
        
        
        
        
        updateFocusIfNeeded()
        
    }
    
    @IBAction func PressShop(_ sender: Any) {
        
        performSegue(withIdentifier: "Store", sender: nil)
    }
    
    
}

extension SiriRemote{
    
}
