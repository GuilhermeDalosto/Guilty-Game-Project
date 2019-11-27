//
//  CustomizeJudgeVC.swift
//  GuiltyGameProject
//
//  Created by Igor de Castro on 26/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import UIKit

class CustomizeJudgeViewController: UIViewController {
        
    @IBOutlet weak var judgeCollectionVIew: UICollectionView!
    
    
    @IBOutlet weak var imageHammer: UIImageView!
    
    var judge = [UIImage]()
    var judgeIdentifier = [""]
    var hammer = [UIImage]()
    var hammerIdentifier = [""]
    var _judgeIndex = 0
    var _hammerIndex = 0
    var typeTheme: Int?
    var typeDifficulty: Int?
    var typePeople: Int?
    
    override func viewDidLoad() {
       // judge = judgeIdentifier.map{UIImage(named: $0)!}
        super.viewDidLoad()
    }
    
    
    @IBAction func scrollRightJudge(_ sender: Any) {
        if(_judgeIndex < judge.count - 1){
            judgeCollectionVIew.scrollToItem(at: IndexPath(row: _judgeIndex + 1, section: 0), at: .right, animated: true)
            _judgeIndex += 1
        }
    }
    
    @IBAction func scrollLeftJudge(_ sender: Any) {
        if(_judgeIndex > 0) {
            judgeCollectionVIew.scrollToItem(at: IndexPath(row: _judgeIndex - 1, section: 0), at: .left, animated: true)
            _judgeIndex -= 1
        }
    }

    @IBAction func pressStart(_ sender: Any) {
        performSegue(withIdentifier: "goGame", sender: nil)
    }
    
    @IBAction func pressBack(_ sender: Any) {
        performSegue(withIdentifier: "goBack", sender: nil)
    }
    
}
extension CustomizeJudgeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            return judge.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = judgeCollectionVIew.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomizeJudgeCollectionViewCell
        cell.imageJudge.image = judge[indexPath.row]
        cell.imageJudge.contentMode = .center
        return cell

    }
}


