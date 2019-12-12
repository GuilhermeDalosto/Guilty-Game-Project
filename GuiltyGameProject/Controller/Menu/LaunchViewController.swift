//
//  LaunchViewController.swift
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 06/12/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
    
    @IBOutlet weak var fromSoftware: UIImageView!
    let music = Sound()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fromSoftware.alpha = 0
        music.play("darksouls2", type: ".mp4")
        
        
        
        UIView.animate(withDuration: 1) {
            self.fromSoftware.alpha = 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.performSegue(withIdentifier: "segueMain", sender: self)
        }
            
            // Do any additional setup after loading the view.
        
        
    }
    
    
    
    

}
