//
//  Report5VC.swift
//  GuiltyGameProject
//
//  Created by Ferraz on 27/01/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import UIKit

class Report5ViewController: UIViewController, StatisticsProtocol{
    var playersInfo: [StatisticsInfo] = [StatisticsInfo]()
    
    func sendPlayersInfo(playersInfo: [StatisticsInfo]) {
        self.playersInfo = playersInfo
    }
    
    
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
//    weak var delegate: StatisticsProtocol?
    
    var arrayLabel = [UILabel]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        word00.text = ""
        word01.text = ""
        word02.text = ""
        word03.text = ""
        word10.text = ""
        word11.text = ""
        word12.text = ""
        word13.text = ""
        word20.text = ""
        word21.text = ""
        word22.text = ""
        word23.text = ""
        word30.text = ""
        word31.text = ""
        word32.text = ""
        word33.text = ""
        setAll()
        print("AAAAAA")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        performSegue(withIdentifier: "unwindToMenu", sender: nil)
    }
    
    func setAll(){
        labelArrayCreate()
        setBackGround()
        setWords()
    }
    
    func labelArrayCreate(){
        arrayLabel.append(word00)
        arrayLabel.append(word01)
        arrayLabel.append(word02)
        arrayLabel.append(word03)
        arrayLabel.append(word10)
        arrayLabel.append(word11)
        arrayLabel.append(word12)
        arrayLabel.append(word13)
        arrayLabel.append(word20)
        arrayLabel.append(word21)
        arrayLabel.append(word22)
        arrayLabel.append(word23)
        arrayLabel.append(word30)
        arrayLabel.append(word31)
        arrayLabel.append(word32)
        arrayLabel.append(word33)
    }
    
    func setBackGround(){
        if NSLocalizedString("startText", comment: "") != "Start"{
            backgroundImage.image = UIImage(named: "cincoPt")
        } else {
            backgroundImage.image = UIImage(named: "cincoPt")
        }
    }
    
    func setWords(){
//        guard let word000 = playersInfo[0].words[0] else { return }
//        word00.text = word000
//        guard let word001 = playersInfo[1].words[0] else { return }
//        word10.text = word001
//        guard let word002 = playersInfo[2].words[0] else { return }
//        word20.text = word002
//        guard let word003 = playersInfo[3].words[0] else { return }
//        word30.text = word003
//        guard let word004 = playersInfo[0].words[1] else { return }
//        word01.text = word004
//        guard let word005 = playersInfo[1].words[1] else { return }
//        word11.text = word005
//        guard let word006 = playersInfo[2].words[1] else { return }
//        word21.text = word006
//        guard let word007 = playersInfo[3].words[1] else { return }
//        word31.text = word007
//        guard let word008 = playersInfo[0].words[2] else { return }
//        word02.text = word008
//        guard let word009 = playersInfo[1].words[2] else { return }
//        word12.text = word009
//        guard let word010 = playersInfo[2].words[2] else { return }
//        word22.text = word010
//        guard let word011 = playersInfo[3].words[2] else { return }
//        word32.text = word011
//        guard let word012 = playersInfo[0].words[3] else { return }
//        word03.text = word012
//        guard let word013 = playersInfo[1].words[3] else { return }
//        word13.text = word013
//        guard let word014 = playersInfo[2].words[3] else { return }
//        word23.text = word014
//        guard let word015 = playersInfo[3].words[3] else { return }
//        word33.text = word015
        
        var aux = 0
        for player in playersInfo{
            for word in player.words{
                arrayLabel[aux].text = word
                aux += 1
            }
            print("=======")
        }
    }
    
}
