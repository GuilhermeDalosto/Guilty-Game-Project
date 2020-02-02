//
//  LaunchViewController.swift
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 06/12/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
    
    @IBOutlet weak var frontImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    let music = Sound()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backgroundImage.layer.zPosition = -1
        self.frontImage.alpha = 0
        music.play("introGuilty1", type: ".wav",repeat: 0)
        
        
        
        UIView.animate(withDuration: 1.7) {
            self.frontImage.alpha = 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.7) {
            self.performSegue(withIdentifier: "segueMain", sender: self)
        }
            
            // Do any additional setup after loading the view.
        
        
    }
    
    
    
    

}
