//
//  AllUserOnboardingVC.swift
//  GuiltyGameProject
//
//  Created by Ferraz on 11/01/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import UIKit

class JudgeUOViewController: UIViewController{
    
    var selecaoPequena = UIImageView(image: UIImage(named: "selecaoPequena2"))
    
    @IBOutlet weak var text00: UILabel!
    @IBOutlet weak var text01: UILabel!
    @IBOutlet weak var text02: UILabel!
    
    @IBOutlet weak var text10: UILabel!
    @IBOutlet weak var text11: UILabel!
    @IBOutlet weak var text12: UILabel!
    
    @IBOutlet weak var previousButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.addSubview(selecaoPequena)
        self.selecaoPequena.layer.position = previousButton.layer.position
        self.selecaoPequena.layer.zPosition = 1
        self.previousButton.layer.zPosition = 2
        self.nextButton.layer.zPosition = 2
        
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        switch context.nextFocusedView{
        case previousButton:
            self.selecaoPequena.layer.position = previousButton.layer.position
        default:
            self.selecaoPequena.layer.position = nextButton.layer.position
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text00.layer.borderColor = UIColor.cyan.cgColor
        text00.layer.masksToBounds = true
        text00.layer.cornerRadius = 10.0
        text00.layer.borderWidth = 3.0
        
        text01.layer.borderColor = UIColor.cyan.cgColor
        text01.layer.masksToBounds = true
        text01.layer.cornerRadius = 10.0
        text01.layer.borderWidth = 3.0
        
        text02.layer.borderColor = UIColor.cyan.cgColor
        text02.layer.masksToBounds = true
        text02.layer.cornerRadius = 10.0
        text02.layer.borderWidth = 3.0
        
        text10.layer.masksToBounds = true
        text10.layer.cornerRadius = 20.0
        
        text11.layer.masksToBounds = true
        text11.layer.cornerRadius = 20.0
        
        text12.layer.masksToBounds = true
        text12.layer.cornerRadius = 20.0
    }
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

class DefendantUOViewController: UIViewController{
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var text10: UILabel!
    @IBOutlet weak var text01: UILabel!
    @IBOutlet weak var text02: UILabel!
    @IBOutlet weak var text11: UILabel!
    @IBOutlet weak var text12: UILabel!
    @IBOutlet weak var text00: UILabel!
    
    var selecaoPequena = UIImageView(image: UIImage(named: "selecaoPequena2"))
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.addSubview(selecaoPequena)
        self.selecaoPequena.layer.position = previousButton.layer.position
        self.selecaoPequena.layer.zPosition = 1
               self.previousButton.layer.zPosition = 2
               self.nextButton.layer.zPosition = 2
        
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        switch context.nextFocusedView{
        case previousButton:
            self.selecaoPequena.layer.position = previousButton.layer.position
        default:
            self.selecaoPequena.layer.position = nextButton.layer.position
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text00.layer.borderColor = UIColor.cyan.cgColor
        text00.layer.masksToBounds = true
        text00.layer.cornerRadius = 10.0
        text00.layer.borderWidth = 3.0
        
        text01.layer.borderColor = UIColor.cyan.cgColor
        text01.layer.masksToBounds = true
        text01.layer.cornerRadius = 10.0
        text01.layer.borderWidth = 3.0
        
        text02.layer.borderColor = UIColor.cyan.cgColor
        text02.layer.masksToBounds = true
        text02.layer.cornerRadius = 10.0
        text02.layer.borderWidth = 3.0
        
        text10.layer.masksToBounds = true
        text10.layer.cornerRadius = 20.0
        
        text11.layer.masksToBounds = true
        text11.layer.cornerRadius = 20.0
        
        text12.layer.masksToBounds = true
        text12.layer.cornerRadius = 20.0
    }
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

class GameUOViewController: UIViewController{
    
    var selecaoPequena = UIImageView(image: UIImage(named: "selecaoPequena2"))
    
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    
    @IBOutlet weak var text00: UILabel!
    @IBOutlet weak var text01: UILabel!
    @IBOutlet weak var text02: UILabel!
    
    @IBOutlet weak var text10: UILabel!
    @IBOutlet weak var text11: UILabel!
    @IBOutlet weak var text12: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
          self.view.addSubview(selecaoPequena)
          self.selecaoPequena.layer.position = previousButton.layer.position
        self.selecaoPequena.layer.zPosition = 1
               self.previousButton.layer.zPosition = 2
               self.nextButton.layer.zPosition = 2
          
      }
      
      override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
          switch context.nextFocusedView{
          case previousButton:
              self.selecaoPequena.layer.position = previousButton.layer.position
          default:
              self.selecaoPequena.layer.position = nextButton.layer.position
          }
      }
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text00.layer.borderColor = UIColor.cyan.cgColor
        text00.layer.masksToBounds = true
        text00.layer.cornerRadius = 10.0
        text00.layer.borderWidth = 3.0
        
        text01.layer.borderColor = UIColor.cyan.cgColor
        text01.layer.masksToBounds = true
        text01.layer.cornerRadius = 10.0
        text01.layer.borderWidth = 3.0
        
        text02.layer.borderColor = UIColor.cyan.cgColor
        text02.layer.masksToBounds = true
        text02.layer.cornerRadius = 10.0
        text02.layer.borderWidth = 3.0
        
        text10.layer.masksToBounds = true
        text10.layer.cornerRadius = 20.0
        
        text11.layer.masksToBounds = true
        text11.layer.cornerRadius = 20.0
        
        text12.layer.masksToBounds = true
        text12.layer.cornerRadius = 20.0
    }
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

class TurnUOViewController: UIViewController{
    
    var selecaoPequena = UIImageView(image: UIImage(named: "selecaoPequena2"))
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousbutton: UIButton!
    @IBOutlet weak var text00: UILabel!
    @IBOutlet weak var text01: UILabel!
    @IBOutlet weak var text02: UILabel!
    @IBOutlet weak var text10: UILabel!
    @IBOutlet weak var text11: UILabel!
    @IBOutlet weak var text12: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
          self.view.addSubview(selecaoPequena)
          self.selecaoPequena.layer.position = previousbutton.layer.position
        self.selecaoPequena.layer.zPosition = 1
               self.previousbutton.layer.zPosition = 2
               self.nextButton.layer.zPosition = 2
          
      }
      
      override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
          switch context.nextFocusedView{
          case previousbutton:
              self.selecaoPequena.layer.position = previousbutton.layer.position
          default:
              self.selecaoPequena.layer.position = nextButton.layer.position
          }
      }
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text00.layer.borderColor = UIColor.cyan.cgColor
        text00.layer.masksToBounds = true
        text00.layer.cornerRadius = 10.0
        text00.layer.borderWidth = 3.0
        
        text01.layer.borderColor = UIColor.cyan.cgColor
        text01.layer.masksToBounds = true
        text01.layer.cornerRadius = 10.0
        text01.layer.borderWidth = 3.0
        
        text02.layer.borderColor = UIColor.cyan.cgColor
        text02.layer.masksToBounds = true
        text02.layer.cornerRadius = 10.0
        text02.layer.borderWidth = 3.0
        
        text10.layer.masksToBounds = true
        text10.layer.cornerRadius = 20.0
        
        text11.layer.masksToBounds = true
        text11.layer.cornerRadius = 20.0
        
        text12.layer.masksToBounds = true
        text12.layer.cornerRadius = 20.0
    }
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

class TeamUOViewController: UIViewController{
    
    var selecaoPequena = UIImageView(image: UIImage(named: "selecaoPequena2"))
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var text00: UILabel!
    @IBOutlet weak var text01: UILabel!
    @IBOutlet weak var text10: UILabel!
    @IBOutlet weak var text11: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
          self.view.addSubview(selecaoPequena)
          self.selecaoPequena.layer.position = previousButton.layer.position
        self.selecaoPequena.layer.zPosition = 1
               self.previousButton.layer.zPosition = 2
               self.nextButton.layer.zPosition = 2
          
      }
      
      override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
          switch context.nextFocusedView{
          case previousButton:
              self.selecaoPequena.layer.position = previousButton.layer.position
          default:
              self.selecaoPequena.layer.position = nextButton.layer.position
          }
      }
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text00.layer.borderColor = UIColor.cyan.cgColor
        text00.layer.masksToBounds = true
        text00.layer.cornerRadius = 10.0
        text00.layer.borderWidth = 3.0
        
        text01.layer.borderColor = UIColor.cyan.cgColor
        text01.layer.masksToBounds = true
        text01.layer.cornerRadius = 10.0
        text01.layer.borderWidth = 3.0
        
        text10.layer.masksToBounds = true
        text10.layer.cornerRadius = 20.0
        
        text11.layer.masksToBounds = true
        text11.layer.cornerRadius = 20.0
    }
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

class ControlUOViewController: UIViewController{
    
    var selecaoPequena = UIImageView(image: UIImage(named: "selecaoPequena2"))
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var text03: UILabel!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var text01: UILabel!
    @IBOutlet weak var text00: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
          self.view.addSubview(selecaoPequena)
          self.selecaoPequena.layer.position = previousButton.layer.position
        self.selecaoPequena.layer.zPosition = 1
               self.previousButton.layer.zPosition = 2
               self.nextButton.layer.zPosition = 2
          
      }
      
      override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
          switch context.nextFocusedView{
          case previousButton:
              self.selecaoPequena.layer.position = previousButton.layer.position
          default:
              self.selecaoPequena.layer.position = nextButton.layer.position
          }
      }
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
