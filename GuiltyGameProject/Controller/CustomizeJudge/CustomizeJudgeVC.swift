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
    
    var focusedGuideUp = UIFocusGuide()
    var focusedGuideLeft = UIFocusGuide()
    var focusedGuideLeftDown = UIFocusGuide()
    var focusedGuideRightDown = UIFocusGuide()
    var focusedGuideRightUp = UIFocusGuide()
    var focusedGuideLeftDownDown = UIFocusGuide()
    
    var setaDireitaDes = UIImage(named: "setaDireitaSelecionado")
    var setaEsquerdaDes = UIImage(named: "setaEsquerdaSelecionado")
    
    var setaDireitaSel = UIImage(named: "setaDireita")
    var setaEsquerdaSel = UIImage(named: "setaEsquerda")
    
    var homeSel = UIImage(named: "home")
    var homeDes = UIImage(named: "homeSelecionado")
    
    var menuSel = UIImage(named: "menu")
    var menuDes = UIImage(named: "menuSelecionado")
    
    var jogarSel = UIImage(named: "jogar")
    var jogarDes = UIImage(named: "jogarSelecionado")
    
    var startSel = UIImage(named: "start")
    var startDes = UIImage(named: "startSelecionado")
    
    var pequenoAzul = UIImageView(image: UIImage(named: "selecaoPequena2"))
    var grandeAzul = UIImageView(image: UIImage(named: "selecaoQuadrado2"))
    
    @IBOutlet weak var judgeCollectionVIew: UICollectionView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    
    @IBOutlet weak var imageHammer: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var decks = Deck()
    
    let boolNinja = true
    let boolFood = false
    let boolOldWest = false
    let boolMagic = false
    let boolAnimal = false
    let boolNatal = false
    
    var characterSelected : UIImage?
    
    var judge = [UIImage]()
    var infoJudge = [UIImage]()
    var judgeIdentifier = [""]
    var hammer = [UIImage]()
    var hammerIdentifier = [""]
    var _judgeIndex = 0
    var _hammerIndex = 0
    var typeTheme: Int?
    var typeDifficulty: Int?
    var typePeople: Int?
    let sfx = Sound()
    
    var firstLaunch = true
    override weak var preferredFocusedView: UIView? {
        if (self.firstLaunch) {
            self.firstLaunch = false;
            return self.leftButton;
        }  else {
            let view  = super.preferredFocusedView
            return view;
            
        }
    }
    
    
    override func viewDidLoad() {
        // judge = judgeIdentifier.map{UIImage(named: $0)!}
        super.viewDidLoad()
        setLayoutGuide()
        populateJudge()
        judgeCollectionVIew.allowsSelection = false
        judgeCollectionVIew.delegate = self
        judgeCollectionVIew.dataSource = self
        judgeCollectionVIew.backgroundColor = .clear
        
    }
    
    var language = ""
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.backButton.layer.zPosition = 2
        self.startButton.layer.zPosition = 2
        self.rightButton.layer.zPosition = 2
        self.leftButton.layer.zPosition = 2
        self.pequenoAzul.layer.zPosition = 1
        self.grandeAzul.layer.zPosition = 1
        
        self.view.addSubview(pequenoAzul)
        self.view.addSubview(grandeAzul)
        self.grandeAzul.layer.position = self.leftButton.layer.position
        self.pequenoAzul.alpha = 0
        
        
        if NSLocalizedString("startText", comment: "") == "Start"{
            language = "EN"
            self.backButton.setImage(homeSel, for: .normal)
            self.startButton.setImage(startSel, for: .normal)
        } else{
            language = "PT"
            self.backButton.setImage(menuSel, for: .normal)
            self.startButton.setImage(jogarSel, for: .normal)
        }
        self.leftButton.setImage(UIImage(named:"setaEsquerdaSelecionado"), for: .normal)
        _judgeIndex = 0
        backButton.setTitle(NSLocalizedString("backText", comment: ""), for: .normal)
        startButton.setTitle(NSLocalizedString("startText", comment: ""), for: .normal)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        characterSelected = judge[_judgeIndex]
        UserDefaults.standard.set(_judgeIndex,forKey: "positionCollection")
    }
    
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        guard let focus = context.nextFocusedView else {return}
        guard let focusedGuideUp = context.nextFocusedView else {return}
        guard let focusedGuideLeft = context.nextFocusedView else {return}
        guard let focusedGuideLeftDown = context.nextFocusedView else {return}
        guard let focusedGuideGuideRightDown = context.nextFocusedView else {return}
        guard let focusedGuideGuideRightUp = context.nextFocusedView else {return}
        guard let focusedGuideGuideDownDown = context.nextFocusedView else {return}
        self.pequenoAzul.alpha = 0
        self.grandeAzul.alpha = 1
        sfx.play("PassOption", type: ".wav", repeat: 0)
        switch focus{
        case self.backButton:
            self.grandeAzul.alpha = 0
            self.pequenoAzul.alpha = 1
            self.pequenoAzul.layer.position = self.backButton.layer.position
        case self.leftButton:
            self.grandeAzul.alpha = 1
            self.grandeAzul.layer.position = self.leftButton.layer.position
        case self.rightButton:
            self.grandeAzul.alpha = 1
            self.grandeAzul.layer.position = self.rightButton.layer.position
        default:
            self.grandeAzul.alpha = 0
            self.pequenoAzul.alpha = 1
            self.pequenoAzul.layer.position = self.startButton.layer.position
        }
        
        
        
        switch focusedGuideUp{
        case self.leftButton:
            self.focusedGuideUp.preferredFocusedView = self.backButton
            
        case self.backButton:
            self.focusedGuideUp.preferredFocusedView = self.leftButton
        case self.rightButton:
            self.focusedGuideUp.preferredFocusedView = self.startButton
        default:
            self.focusedGuideUp.preferredFocusedView = nil
        }
        
        switch focusedGuideLeft {
        case self.backButton:
            self.focusedGuideLeft.preferredFocusedView = self.leftButton
        case self.leftButton:
            self.focusedGuideLeft.preferredFocusedView = self.backButton
        default:
            self.focusedGuideLeft.preferredFocusedView = nil
        }
        
        switch focusedGuideLeftDown{
        case self.rightButton:
            self.focusedGuideLeftDown.preferredFocusedView = self.startButton
        case self.startButton:
            self.focusedGuideLeftDown.preferredFocusedView = self.rightButton
        case self.leftButton:
            self.focusedGuideLeftDown.preferredFocusedView = self.startButton
        default:
            self.focusedGuideLeftDown.preferredFocusedView = nil
        }
        
        switch focusedGuideGuideRightDown{
        case self.rightButton:
            self.focusedGuideRightDown.preferredFocusedView = self.startButton
        case self.startButton:
            self.focusedGuideRightDown.preferredFocusedView = self.rightButton
        default:
            self.focusedGuideRightDown.preferredFocusedView = self.rightButton
        }
        
        switch focusedGuideGuideRightUp{
        case self.rightButton:
            self.focusedGuideRightUp.preferredFocusedView = self.backButton
        default:
            self.focusedGuideRightUp.preferredFocusedView = self.rightButton
        }
        
        
        switch focusedGuideGuideDownDown{
        case self.leftButton:
            self.focusedGuideLeftDownDown.preferredFocusedView = self.startButton
        default:
            self.focusedGuideLeftDownDown.preferredFocusedView = nil
        }
        
        
        
    }
    
    func setLayoutGuide(){
        self.view.addLayoutGuide(focusedGuideUp)
        self.view.addLayoutGuide(focusedGuideLeft)
        self.view.addLayoutGuide(focusedGuideLeftDown)
        self.view.addLayoutGuide(focusedGuideRightDown)
        self.view.addLayoutGuide((focusedGuideRightUp))
        self.view.addLayoutGuide(focusedGuideLeftDownDown)
        
        
        self.focusedGuideUp.leftAnchor.constraint(equalTo: self.leftButton.leftAnchor).isActive = true
        self.focusedGuideUp.widthAnchor.constraint(equalTo: self.leftButton.widthAnchor).isActive = true
        
        self.focusedGuideUp.heightAnchor.constraint(equalTo: self.backButton.heightAnchor).isActive = true
        self.focusedGuideUp.topAnchor.constraint(equalTo: self.backButton.topAnchor).isActive = true
        
        self.focusedGuideLeft.leftAnchor.constraint(equalTo: self.backButton.leftAnchor).isActive = true
        self.focusedGuideLeft.widthAnchor.constraint(equalTo: self.backButton.widthAnchor).isActive = true
        
        self.focusedGuideLeft.heightAnchor.constraint(equalTo: self.leftButton.heightAnchor).isActive = true
        self.focusedGuideLeft.topAnchor.constraint(equalTo: self.leftButton.topAnchor).isActive = true
        
        self.focusedGuideLeftDown.rightAnchor.constraint(equalTo: self.rightButton.rightAnchor).isActive = true
        self.focusedGuideLeftDown.widthAnchor.constraint(equalTo: self.rightButton.widthAnchor).isActive = true
        
        self.focusedGuideLeftDown.heightAnchor.constraint(equalTo: self.rightButton.heightAnchor).isActive = true
        self.focusedGuideLeftDown.topAnchor.constraint(equalTo: self.startButton.topAnchor).isActive = true
        
        self.focusedGuideRightDown.leftAnchor.constraint(equalTo: self.startButton.leftAnchor).isActive = true
        self.focusedGuideRightDown.widthAnchor.constraint(equalTo: self.startButton.widthAnchor).isActive = true
        
        self.focusedGuideRightDown.heightAnchor.constraint(equalTo: self.rightButton.heightAnchor).isActive = true
        self.focusedGuideRightDown.topAnchor.constraint(equalTo: self.rightButton.topAnchor).isActive = true
        
        self.focusedGuideRightUp.leftAnchor.constraint(equalTo: self.rightButton.leftAnchor).isActive = true
        self.focusedGuideRightUp.widthAnchor.constraint(equalTo: self.rightButton.widthAnchor).isActive = true
        
        self.focusedGuideRightUp.heightAnchor.constraint(equalTo: self.backButton.heightAnchor).isActive = true
        self.focusedGuideRightUp.topAnchor.constraint(equalTo: self.backButton.topAnchor).isActive = true
        
        self.focusedGuideLeftDownDown.leftAnchor.constraint(equalTo: self.leftButton.leftAnchor).isActive = true
        self.focusedGuideLeftDownDown.widthAnchor.constraint(equalTo: self.leftButton.widthAnchor).isActive = true
        
        self.focusedGuideLeftDownDown.heightAnchor.constraint(equalTo: self.startButton.heightAnchor).isActive = true
        self.focusedGuideLeftDownDown.topAnchor.constraint(equalTo: self.startButton.topAnchor).isActive = true
        
        
        
    }
    
    
    
    @IBAction func scrollRightJudge(_ sender: Any) {
        sfx.play("ChooseOption", type: ".wav", repeat: 0)
        if(_judgeIndex < judge.count - 1){
            judgeCollectionVIew.scrollToItem(at: IndexPath(row: _judgeIndex + 1, section: 0), at: .right, animated: true)
            _judgeIndex += 1
        }
        if _judgeIndex == judge.count - 1 {
            rightButton.setImage(setaDireitaDes, for: .normal)
        } else{
            rightButton.setImage(setaDireitaSel, for: .normal)
        }
        
        if _judgeIndex == 0 {
            leftButton.setImage(setaEsquerdaDes, for: .normal)
        } else{
            leftButton.setImage(setaEsquerdaSel, for: .normal)
        }
    }
    
    @IBAction func scrollLeftJudge(_ sender: Any) {
        sfx.play("ChooseOption", type: ".wav", repeat: 0)
        if(_judgeIndex > 0) {
            judgeCollectionVIew.scrollToItem(at: IndexPath(row: _judgeIndex - 1, section: 0), at: .left, animated: true)
            _judgeIndex -= 1
            
        }
               
          if _judgeIndex == judge.count - 1 {
                 rightButton.setImage(setaDireitaDes, for: .normal)
             } else{
                 rightButton.setImage(setaDireitaSel, for: .normal)
             }
             
             if _judgeIndex == 0 {
                 leftButton.setImage(setaEsquerdaDes, for: .normal)
             } else{
                 leftButton.setImage(setaEsquerdaSel, for: .normal)
             }
    }
    
    @IBAction func pressStart(_ sender: Any) {
        sfx.play("ChooseOption", type: ".wav", repeat: 0)
        performSegue(withIdentifier: "goGame", sender: nil)
        
    }
    
    @IBAction func pressBack(_ sender: Any) {
        sfx.play("ChooseOption", type: ".wav", repeat: 0)
        performSegue(withIdentifier: "goBack", sender: nil)
    }
    
    func populateJudge(){
        judge.append(UIImage(named: "bigjudge0")!)
        judge.append(UIImage(named: "bigjudge1")!)
        judge.append(UIImage(named: "bigjudge2")!)
        judge.append(UIImage(named: "bigjudge3")!)
        judge.append(UIImage(named: "bigjudge4")!)
        
        if NSLocalizedString("startText", comment: "") == "Start"{
            infoJudge.append(UIImage(named: "juiz")!)
            infoJudge.append(UIImage(named: "noel")!)
            infoJudge.append(UIImage(named: "branca")!)
            infoJudge.append(UIImage(named: "charlie")!)
            infoJudge.append(UIImage(named: "cinderela")!)
        } else {
            infoJudge.append(UIImage(named: "juiz")!)
            infoJudge.append(UIImage(named: "noel")!)
            infoJudge.append(UIImage(named: "branca")!)
            infoJudge.append(UIImage(named: "charlie")!)
            infoJudge.append(UIImage(named: "cinderela")!)
        }
    }
    
}


extension CustomizeJudgeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return judge.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.judgeCollectionVIew.frame.size
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = judgeCollectionVIew.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomizeJudgeCollectionViewCell
        cell.imageJudge.image = judge[indexPath.row]
        cell.infoImage.image = infoJudge[indexPath.row]
      //  cell.imageJudge.frame.size = CGSize(
        cell.imageJudge.contentMode = .center
        
        
        return cell
        
    }
    

    
}




