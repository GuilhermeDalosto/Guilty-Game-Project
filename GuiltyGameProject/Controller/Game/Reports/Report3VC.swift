//
//  Report3VC.swift
//  GuiltyGameProject
//
//  Created by Ferraz on 27/01/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import UIKit

protocol StatisticsProtocol: NSObject{
    var playersInfo: [StatisticsInfo] { get set }
}

class Report3ViewController: UIViewController{
    
    @IBOutlet weak var word00: UILabel!
    @IBOutlet weak var word01: UILabel!
    @IBOutlet weak var word02: UILabel!
    @IBOutlet weak var word03: UILabel!
    @IBOutlet weak var word04: UILabel!
    @IBOutlet weak var word05: UILabel!
    @IBOutlet weak var word10: UILabel!
    @IBOutlet weak var word11: UILabel!
    @IBOutlet weak var word12: UILabel!
    @IBOutlet weak var word13: UILabel!
    @IBOutlet weak var word14: UILabel!
    @IBOutlet weak var word15: UILabel!
    
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
            backgroundImage.image = UIImage(named: "tresPt")
        } else {
            backgroundImage.image = UIImage(named: "tresEn")
        }
    }
    
    func setWords(){
        guard let word000 = delegate?.playersInfo[0].words[0] else { return }
        word00.text = word000
        guard let word001 = delegate?.playersInfo[1].words[0] else { return }
        word10.text = word001
        guard let word002 = delegate?.playersInfo[0].words[1] else { return }
        word01.text = word002
        guard let word003 = delegate?.playersInfo[1].words[1] else { return }
        word11.text = word003
        guard let word004 = delegate?.playersInfo[0].words[2] else { return }
        word02.text = word004
        guard let word005 = delegate?.playersInfo[1].words[2] else { return }
        word12.text = word005
        guard let word006 = delegate?.playersInfo[0].words[3] else { return }
        word03.text = word006
        guard let word007 = delegate?.playersInfo[1].words[3] else { return }
        word13.text = word007
        guard let word008 = delegate?.playersInfo[0].words[4] else { return }
        word04.text = word008
        guard let word009 = delegate?.playersInfo[1].words[4] else { return }
        word14.text = word009
        guard let word010 = delegate?.playersInfo[0].words[5] else { return }
        word05.text = word010
        guard let word011 = delegate?.playersInfo[1].words[5] else { return }
        word15.text = word011
    }
}
