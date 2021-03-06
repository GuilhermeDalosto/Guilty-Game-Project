//
//  ViewController.swift
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 25/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import UIKit

//protocol StatisticsProtocol: NSObject{
//    var playersInfo: [StatisticsInfo] { get set }
//}

class ViewController: UIViewController  {
    
    ///Menu button
    let menuPressRecognizer = UITapGestureRecognizer()
    var vencedor = "Ninguém"
    var defaults = AllUserDefault()
    private var focusGuideSelected = UIFocusGuide()
    @IBOutlet weak var backBTN: UIButton!
    weak var delegate: StatisticsProtocol?
    
    @IBOutlet weak var staticsCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        staticsCollection.delegate = self
        staticsCollection.dataSource = self
        
//        menuPressRecognizer.addTarget(self, action: "menuButtonAction:")
//        menuPressRecognizer.allowedPressTypes = [NSNumber(value: UIPress.PressType.menu.rawValue)]
//        self.view.addGestureRecognizer(menuPressRecognizer)
        defaults.screenNumber = 3
        
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        guard let focus = context.nextFocusedView else {return}
        
        print(focus)
        
        switch focus{
        default:
            UIView.animate(withDuration: 0.3) {
                self.backBTN.frame.size.height += 15
                self.backBTN.frame.size.width += 15
            }
            
        }
        
        if backBTN.frame.size.width > 250 && focus != self.backBTN {
            UIView.animate(withDuration: 0.3) {
                self.backBTN.frame.size.height -= 15
                self.backBTN.frame.size.width -= 15
            }
        }
        
        
        
        
        
        updateFocusIfNeeded()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numberOfPlayers = UserDefaults.standard.integer(forKey: "numberOfPlayers")
        return numberOfPlayers
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionCell

        
        return cell
    }
}
