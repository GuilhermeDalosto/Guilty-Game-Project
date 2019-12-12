//
//  ViewController.swift
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 25/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import UIKit

protocol StatisticsProtocol: NSObject{
    var playersInfo: [StatisticsInfo] { get set }
}

class ViewController: UIViewController  {
    
    var vencedor = "Ninguém"
    weak var delegate: StatisticsProtocol?
    
    @IBOutlet weak var winner: UILabel!
    @IBOutlet weak var statisticsTableView: UITableView!
    @IBOutlet weak var gameOverLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statisticsTableView.delegate = self
        statisticsTableView.dataSource = self
        
        winner.text = vencedor
        
        
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberPlayers = UserDefaults.standard.integer(forKey: "numberOfPlayers")
        
        return numberPlayers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as! TableViewCell
        
//        cell.pinImage.image = UIImage(named: "")
//        cell.wordLabel.text = ""
//        cell.eventLabel.text = ""
//        cell.acceptedImage.image = UIImage(named: "")
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return GameScene.round
    }
}
