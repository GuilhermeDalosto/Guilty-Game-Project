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
    
    var configSel = UIImage(named: "configuracoes")
    var configuracoesSel = UIImage(named: "settingsMenu")
    var jogarSel = UIImage(named: "jogarMenu")
    var playSel = UIImage(named: "playMenu")
    var shopSel = UIImage(named: "shop")
    var lojaSel = UIImage(named: "loja")
    
    
        var configDes = UIImage(named: "settingsMenu")
       var configuracoesDes = UIImage(named: "configuracoes")
       var jogarDes = UIImage(named: "jogarMenu")
       var playDes = UIImage(named: "playMenu")
       var shopDes = UIImage(named: "shop")
       var lojaDes = UIImage(named: "loja")
    
    
//    var configDes = UIImage(named: "configDes")
//    var configuracoesDes = UIImage(named: "configuracoesDes")
//    var jogarDes = UIImage(named: "jogarDes")
//    var playDes = UIImage(named: "playMenuSelecionado")
//    var shopDes = UIImage(named: "shopDes")
//    var lojaDes = UIImage(named: "lojaDes")
    
    
    @IBOutlet weak var shopButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!    
    
    var language = ""
    
    override func viewWillAppear(_ animated: Bool) {
        
        if NSLocalizedString("startText", comment: "") == "Start"{
            language = "EN"
            self.startButton.setImage(playSel,for: .normal)
            self.settingsButton.setImage(configuracoesSel,for:.normal)
        } else {
            language = "PT"
            self.startButton.setImage(jogarSel,for: .normal)
            self.settingsButton.setImage(configSel,for:.normal)
        }

    }
    
    @IBAction func PressStart(_ sender: Any) {
        performSegue(withIdentifier: "SetGame", sender: nil)
    }
    
    @IBAction func PressSettings(_ sender: Any) {
        performSegue(withIdentifier: "Settings", sender: nil)
    }
    
    
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        guard let focus = context.nextFocusedView else {return}
        print(language)
        switch focus{
        case self.startButton:
            if language == "PT"{
                self.startButton.setImage(jogarSel,for: .normal)
            } else{
                self.startButton.setImage(playSel,for: .normal)
            }
        case self.settingsButton:
            if language == "PT"{
                self.settingsButton.setImage(configSel,for: .normal)
            } else{
                self.settingsButton.setImage(configuracoesSel,for: .normal)
            }
        default:
            if language == "PT"{
                self.shopButton.setImage(lojaSel,for: .normal)
            } else{
                self.shopButton.setImage(shopSel,for: .normal)
            }
            
        }
        
        if  focus != self.startButton {
          if language == "PT"{
            self.startButton.setImage(jogarDes,for: .normal)
            } else{
                self.startButton.setImage(playDes,for: .normal)
            }
        }
        
        if focus != self.settingsButton{
           if language == "PT"{
                self.settingsButton.setImage(configuracoesDes,for: .normal)
            } else{
                self.settingsButton.setImage(configDes,for: .normal)
            }
        }
        
        if  focus != self.shopButton {
            if language == "PT"{
                self.shopButton.setImage(lojaDes,for: .normal)
            } else{
                self.shopButton.setImage(shopDes,for: .normal)
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
