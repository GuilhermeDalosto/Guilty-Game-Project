//
//  StoreTableViewCell.swift
//  GuiltyGameProject
//
//  Created by Igor de Castro on 06/12/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import UIKit
import StoreKit

class StoreTableViewCell: UITableViewCell{
    
    @IBOutlet weak var nameDeck: UILabel!
    
    @IBOutlet weak var imageDeck: UIImageView!
    
    
//    var nome : String{
//        return nameDeck.text
//    }
    
    var priceFormatter: NumberFormatter = {
      let formatter = NumberFormatter()

      formatter.formatterBehavior = .behavior10_4
      formatter.numberStyle = .currency

      return formatter
    }()
    
    var buyButtonHandler: ((_ product: SKProduct) -> Void)?
    
    var product: SKProduct?{
        didSet{
         
            guard let product = product else {return}
            
             textLabel?.text = product.localizedTitle
            if
                    ProductsDLC.store.isProductPurchased(product.productIdentifier) {
                  accessoryType = .checkmark
                  accessoryView = nil
                  detailTextLabel?.text = ""
            } else if StoreDLC.canMakePayments() {
//                let productaux = SKProduct.init()
//                print(priceFormatter.locale!)
                let langStr = Locale.current
                print(langStr)
                self.priceFormatter.locale = Optional(langStr)
                print(priceFormatter.locale!)
                detailTextLabel?.text = self.priceFormatter.string(from: product.price)
                  accessoryType = .none
                show()
//                  accessoryView = self.newBuyButton()
                    } else {
                    detailTextLabel?.text = "Not available"
                    }
        }
    }
    var buyButton: UIButton?
    
   
    func show(){
        buyButtonHandler?(product!)
    }
    
    
    override func prepareForReuse() {
      super.prepareForReuse()
      
        textLabel?.text = ""
        detailTextLabel?.text = ""
        accessoryView = nil
       
    }
    
    
    
//    func newBuyButton() -> UIButton {
//        let button = UIButton(type: .system)
//        button.setTitleColor(.blue, for: .normal)
//        button.setTitle("Buy", for: .normal)
//        button.addTarget(self, action: #selector(StoreTableViewCell.buyButtonTapped(_:)), for: .touchUpInside)
//        button.sizeToFit()
//
//        return button
//    }
    
    @objc func buyButtonTapped(_ sender: AnyObject) {
      buyButtonHandler?(product!)
    }
    
      func newBuyButton()  {
            let button = UIButton(type: .system)
            button.addTarget(self, action: #selector(StoreTableViewCell.buyButtonTapped(_:)), for: .touchUpInside)
            

        }
    
}
