//
//  Report5VC.swift
//  GuiltyGameProject
//
//  Created by Ferraz on 27/01/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import UIKit

class Report5ViewController: UIViewController{
    
    @IBOutlet weak var word00: UILabel!
    @IBOutlet weak var word01: UILabel!
    @IBOutlet weak var word02: UILabel!
    @IBOutlet weak var word03: UILabel!
    @IBOutlet weak var word10: UILabel!
    @IBOutlet weak var word11: UILabel!
    @IBOutlet weak var word12: UILabel!
    @IBOutlet weak var word13: UILabel!
    @IBOutlet weak var word20: UILabel!
    @IBOutlet weak var word21: UILabel!
    @IBOutlet weak var word22: UILabel!
    @IBOutlet weak var word23: UILabel!
    @IBOutlet weak var word30: UILabel!
    @IBOutlet weak var word31: UILabel!
    @IBOutlet weak var word32: UILabel!
    @IBOutlet weak var word33: UILabel!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    weak var delegate: StatisticsProtocol?
    
    override func viewDidLoad() {
        setAll()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        performSegue(withIdentifier: "goMenu", sender: nil)
    }
    
    func setAll(){
        setBackGround()
        setWords()
    }
    
    func setBackGround(){
        if NSLocalizedString("startText", comment: "") != "Start"{
            backgroundImage.image = UIImage(named: "cincoPt")
        } else {
            backgroundImage.image = UIImage(named: "cincoPt")
        }
    }
    
    func setWords(){
        guard let word000 = delegate?.playersInfo[0].words[0] else { return }
        word00.text = word000
        guard let word001 = delegate?.playersInfo[1].words[0] else { return }
        word10.text = word001
        guard let word002 = delegate?.playersInfo[0].words[1] else { return }
        word20.text = word002
        guard let word003 = delegate?.playersInfo[1].words[1] else { return }
        word30.text = word003
        guard let word004 = delegate?.playersInfo[0].words[2] else { return }
        word01.text = word004
        guard let word005 = delegate?.playersInfo[1].words[2] else { return }
        word11.text = word005
        guard let word006 = delegate?.playersInfo[0].words[3] else { return }
        word21.text = word006
        guard let word007 = delegate?.playersInfo[1].words[3] else { return }
        word31.text = word007
        guard let word008 = delegate?.playersInfo[0].words[4] else { return }
        word02.text = word008
        guard let word009 = delegate?.playersInfo[1].words[4] else { return }
        word12.text = word009
        guard let word010 = delegate?.playersInfo[0].words[5] else { return }
        word22.text = word010
        guard let word011 = delegate?.playersInfo[1].words[5] else { return }
        word32.text = word011
        guard let word012 = delegate?.playersInfo[0].words[4] else { return }
        word03.text = word012
        guard let word013 = delegate?.playersInfo[1].words[4] else { return }
        word13.text = word013
        guard let word014 = delegate?.playersInfo[0].words[5] else { return }
        word23.text = word014
        guard let word015 = delegate?.playersInfo[1].words[5] else { return }
        word33.text = word015
    }
    
}
