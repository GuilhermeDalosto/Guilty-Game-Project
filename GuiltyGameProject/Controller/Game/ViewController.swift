//
//  ViewController.swift
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 25/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController  {
    
    var vencedor = "Ninguém"
    
    @IBOutlet weak var winner: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winner.text = vencedor
        
        
        
    }
}
