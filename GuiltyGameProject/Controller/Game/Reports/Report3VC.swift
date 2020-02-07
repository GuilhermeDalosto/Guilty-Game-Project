//
//  Report3VC.swift
//  GuiltyGameProject
//
//  Created by Ferraz on 27/01/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import UIKit

class Report3ViewController: UIViewController, StatisticsProtocol{
    var playersInfo: [StatisticsInfo] = [StatisticsInfo]()
    
    func sendPlayersInfo(playersInfo: [StatisticsInfo]) {
        print("add info")
        print(playersInfo.count)
        print(playersInfo[0].words)
        print(playersInfo[1].words)
        self.playersInfo = playersInfo
    }
    
    // fisrtVC
    
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
    var arrayLabel = [UILabel]()
    let sfx = Sound()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("AAAAAA")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAll()
        print("BBBBBBB")
    }
    
    @IBAction func backBtn(_ sender: Any) {
        sfx.play("ChooseOption", type: ".wav", repeat: 0)
        performSegue(withIdentifier: "unwindToMenu", sender: nil)
    }
    
    func setAll(){
        setSpaceLabel()
        labelArrayCreate()
        setBackGround()
        setWords()
    }
    
    func setSpaceLabel(){
        word00.text = ""
        word01.text = ""
        word02.text = ""
        word03.text = ""
        word04.text = ""
        word05.text = ""
        word10.text = ""
        word11.text = ""
        word12.text = ""
        word13.text = ""
        word14.text = ""
        word15.text = ""
    }
    
    func labelArrayCreate(){
        arrayLabel.append(word00)
        arrayLabel.append(word01)
        arrayLabel.append(word02)
        arrayLabel.append(word03)
        arrayLabel.append(word04)
        arrayLabel.append(word05)
        arrayLabel.append(word10)
        arrayLabel.append(word11)
        arrayLabel.append(word12)
        arrayLabel.append(word13)
        arrayLabel.append(word14)
        arrayLabel.append(word15)
    }
    
    func setBackGround(){
        if NSLocalizedString("startText", comment: "") != "Start"{
            backgroundImage.image = UIImage(named: "tresPT")
        } else {
            backgroundImage.image = UIImage(named: "tresEN")
        }
    }
    
    func setWords(){
//        guard let word000 = playersInfo[0].words[0] else { return }
//        word00.text = word000
//        guard let word001 = playersInfo[1].words[0] else { return }
//        word10.text = word001
//        guard let word002 = playersInfo[0].words[1] else { return }
//        word01.text = word002
//        guard let word003 = playersInfo[1].words[1] else { return }
//        word11.text = word003
//        guard let word004 = playersInfo[0].words[2] else { return }
//        word02.text = word004
//        guard let word005 = playersInfo[1].words[2] else { return }
//        word12.text = word005
//        guard let word006 = playersInfo[0].words[3] else { return }
//        word03.text = word006
//        guard let word007 = playersInfo[1].words[3] else { return }
//        word13.text = word007
//        guard let word008 = playersInfo[0].words[4] else { return }
//        word04.text = word008
//        guard let word009 = playersInfo[1].words[4] else { return }
//        word14.text = word009
//        guard let word010 = playersInfo[0].words[5] else { return }
//        word05.text = word010
//        guard let word011 = playersInfo[1].words[5] else { return }
//        word15.text = word011
        
//        for i in 0...5{
//            for player in playersInfo{
//                if player.words[i] != nil{
//                    word00.text = player.words[i]
//                }
//            }
//        }
        var aux = 0
        for player in playersInfo{
            for word in player.words{
                arrayLabel[aux].text = word
                aux += 1
                if aux % 6 == 0{
                    break
                }
            }
            aux = 6
            print("=======")
        }
    }
}
