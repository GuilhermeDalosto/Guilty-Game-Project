//
//  Report7VC.swift
//  GuiltyGameProject
//
//  Created by Ferraz on 27/01/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import UIKit

class Report7ViewController: UIViewController, StatisticsProtocol{
    
    var playersInfo: [StatisticsInfo] = [StatisticsInfo]()
    
    func sendPlayersInfo(playersInfo: [StatisticsInfo]) {
        print(playersInfo[0].words)
        print(playersInfo[1].words)
        print(playersInfo[2].words)
        print(playersInfo[3].words)
        print(playersInfo[4].words)
        print(playersInfo[5].words)
        self.playersInfo = playersInfo
    }
    
    @IBOutlet weak var word00: UILabel!
    @IBOutlet weak var word01: UILabel!
    @IBOutlet weak var word02: UILabel!
    @IBOutlet weak var word10: UILabel!
    @IBOutlet weak var word11: UILabel!
    @IBOutlet weak var word12: UILabel!
    @IBOutlet weak var word20: UILabel!
    @IBOutlet weak var word21: UILabel!
    @IBOutlet weak var word22: UILabel!
    @IBOutlet weak var word30: UILabel!
    @IBOutlet weak var word31: UILabel!
    @IBOutlet weak var word32: UILabel!
    @IBOutlet weak var word40: UILabel!
    @IBOutlet weak var word41: UILabel!
    @IBOutlet weak var word42: UILabel!
    @IBOutlet weak var word50: UILabel!
    @IBOutlet weak var word51: UILabel!
    @IBOutlet weak var word52: UILabel!
    
    @IBOutlet weak var winner: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    var arrayLabel = [UILabel]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        word00.text = ""
        word01.text = ""
        word02.text = ""
        word10.text = ""
        word11.text = ""
        word12.text = ""
        word20.text = ""
        word21.text = ""
        word22.text = ""
        word30.text = ""
        word31.text = ""
        word32.text = ""
        word40.text = ""
        word41.text = ""
        word42.text = ""
        word50.text = ""
        word51.text = ""
        word52.text = ""
        setAll()        
        var value = UserDefaults.standard.integer(forKey: "vencedor")
               winner.text = "\(NSLocalizedString("team", comment: "")) \(value) \(NSLocalizedString("won", comment: ""))"
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
        arrayLabel.append(word10)
        arrayLabel.append(word11)
        arrayLabel.append(word12)
        arrayLabel.append(word20)
        arrayLabel.append(word21)
        arrayLabel.append(word22)
        arrayLabel.append(word30)
        arrayLabel.append(word31)
        arrayLabel.append(word32)
        arrayLabel.append(word40)
        arrayLabel.append(word41)
        arrayLabel.append(word42)
        arrayLabel.append(word50)
        arrayLabel.append(word51)
        arrayLabel.append(word52)
    }
    
    func setBackGround(){
        if NSLocalizedString("startText", comment: "") != "Start"{
            backgroundImage.image = UIImage(named: "setePt")
        } else {
            backgroundImage.image = UIImage(named: "setePt")
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
//        guard let word004 = playersInfo[4].words[0] else { return }
//        word40.text = word004
//        guard let word005 = playersInfo[5].words[0] else { return }
//        word50.text = word005
//        guard let word006 = playersInfo[0].words[1] else { return }
//        word01.text = word006
//        guard let word007 = playersInfo[1].words[1] else { return }
//        word11.text = word007
//        guard let word008 = playersInfo[2].words[1] else { return }
//        word21.text = word008
//        guard let word009 = playersInfo[3].words[1] else { return }
//        word31.text = word009
//        guard let word010 = playersInfo[4].words[1] else { return }
//        word41.text = word010
//        guard let word011 = playersInfo[5].words[1] else { return }
//        word51.text = word011
//        guard let word012 = playersInfo[0].words[2] else { return }
//        word02.text = word012
//        guard let word013 = playersInfo[1].words[2] else { return }
//        word12.text = word013
//        guard let word014 = playersInfo[2].words[2] else { return }
//        word22.text = word014
//        guard let word015 = playersInfo[3].words[2] else { return }
//        word32.text = word015
//        guard let word016 = playersInfo[4].words[2] else { return }
//        word42.text = word016
//        guard let word017 = playersInfo[5].words[2] else { return }
//        word52.text = word017
        
        var aux = 0
        for player in playersInfo{
            for word in player.words{
                arrayLabel[aux].text = word
                aux += 1
                if aux % 3 == 0{
                    break
                }
            }
            if aux <= 3 {
                aux = 3
            } else if aux <= 6 {
                aux = 6
            } else if aux <= 9 {
                aux = 9
            } else if aux <= 12 {
                aux = 12
            } else if aux <= 15 {
                aux = 15
            }
            print("=======")
        }
    }
    
}
