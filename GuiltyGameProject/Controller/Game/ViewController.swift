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
        guard let word1 = delegate?.playersInfo[indexPath.row].words[0] else { return cell }
        cell.word1.text = word1
        guard let word2 = delegate?.playersInfo[indexPath.row].words[1] else { return cell }
        cell.word2.text = word2
        guard let word3 = delegate?.playersInfo[indexPath.row].words[2] else { return cell }
        cell.word3.text = word3
        guard let word4 = delegate?.playersInfo[indexPath.row].words[3] else { return cell }
        cell.word4.text = word4
        guard let word5 = delegate?.playersInfo[indexPath.row].words[4] else { return cell }
        cell.word5.text = word5
        guard let word6 = delegate?.playersInfo[indexPath.row].words[5] else { return cell }
        cell.word6.text = word6
        guard let word7 = delegate?.playersInfo[indexPath.row].words[6] else { return cell }
        cell.word7.text = word7
        guard let word8 = delegate?.playersInfo[indexPath.row].words[7] else { return cell }
        cell.word8.text = word8
        guard let word9 = delegate?.playersInfo[indexPath.row].words[8] else { return cell }
        cell.word9.text = word9
        guard let word10 = delegate?.playersInfo[indexPath.row].words[9] else { return cell }
        cell.word10.text = word10
        
        return cell
    }
}
