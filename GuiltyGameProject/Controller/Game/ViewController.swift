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
    
    @IBOutlet weak var staticsCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        staticsCollection.delegate = self
        staticsCollection.dataSource = self
        
        
        
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numberOfPlayers = UserDefaults.standard.integer(forKey: "numberOfPlayers")
        return numberOfPlayers
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionCell
        let imageName = (delegate?.playersInfo[indexPath.row].pinColor)!
        
        cell.pinImage.image = UIImage(named: "pin\(imageName)")
        cell.word1.text = delegate?.playersInfo[indexPath.row].words[0] ?? ""
        cell.word2.text = delegate?.playersInfo[indexPath.row].words[1] ?? ""
        cell.word3.text = delegate?.playersInfo[indexPath.row].words[2] ?? ""
        cell.word4.text = delegate?.playersInfo[indexPath.row].words[3] ?? ""
        cell.word5.text = delegate?.playersInfo[indexPath.row].words[4] ?? ""
        cell.word6.text = delegate?.playersInfo[indexPath.row].words[5] ?? ""
        cell.word7.text = delegate?.playersInfo[indexPath.row].words[6] ?? ""
        cell.word8.text = delegate?.playersInfo[indexPath.row].words[7] ?? ""
        cell.word9.text = delegate?.playersInfo[indexPath.row].words[8] ?? ""
        cell.word10.text = delegate?.playersInfo[indexPath.row].words[9] ?? ""
        
        return cell
    }
}
