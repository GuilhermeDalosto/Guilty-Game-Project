//
//  ConfigurationStore.swift
//  GuiltyGameProject
//
//  Created by Igor de Castro on 06/12/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation
import UIKit
import StoreKit

class ConfigurationStore: UITableViewController{
    
    
    var products: [SKProduct] = []
    var array: [String] = ["br.com.deck_food.guilty"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
                       
        
//        guard let indexPath = tableView.indexPathForSelectedRow else {return}
//
//        let product = products[(indexPath as NSIndexPath).row]
//
//        ProductsDLC.store.isProductPurchased(products.productIdentifier)
        
//        var aux = SKProduct()
//        print(aux.localizedTitle)
//        if aux.localizedTitle == ""{
//            print("sysout")
//        }
//        let product1 = SKProductsResponse()
////        print("pinis ", product1)
//        products.insert(product1.products[0], at: 0)
        
        
        title = "Store"
        
        let restoreButton = UIBarButtonItem(title: "Restore",
                                            style: .plain,
                                            target: self,
                                            action: #selector(ConfigurationStore.restoreTapped(_:)))
        navigationItem.rightBarButtonItem = restoreButton
        
        NotificationCenter.default.addObserver(self, selector: #selector(ConfigurationStore.handlePurchaseNotification(_:)),
        name: .StoreDLCPurchaseNotification,
        object: nil)
        
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(pressBack))
        
        navigationItem.leftBarButtonItem = backButton
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)

      reload()
    }
    
    @objc func reload() {
      products = []
      
      tableView.reloadData()
      
      ProductsDLC.store.requestProducts{ [weak self] success, products in
        guard let self = self else { return }
        if success {
            self.products = products!
          print("sucess")
//          self.tableView.reloadData()
        }else{
            print("error")
        }
      }
    }
    
    @objc func restoreTapped(_ sender: AnyObject) {
      ProductsDLC.store.restorePurchases()
    }
    @objc func handlePurchaseNotification(_ notification: Notification) {
       guard
         let productID = notification.object as? String,
        let index = products.firstIndex(where: { product -> Bool in
           product.productIdentifier == productID
         })
       else { return }
       
       tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .fade)
     }
    
    @objc func pressBack(){
        performSegue(withIdentifier: "Main", sender: nil)
    }
    
//    func productsRequest(request: SKProductsRequest, didReceiveResponse response: SKProductsResponse) { if response.products.count > 0 {
//            let product = response.products[0]
//            let payment = SKPayment(product: product)
//            SKPaymentQueue.default().add(payment)
//        }
//
//    }
    
}
extension ConfigurationStore {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! StoreTableViewCell
//        let product = products[0]
        
        let product = products[indexPath.row]

        ProductsDLC.store.isProductPurchased(product.productIdentifier)
        let name = resourceNameForProductIdentifier(product.productIdentifier)
        
        cell.nameDeck.text = name
        cell.imageView?.image = UIImage(named: "pinBlue")
        cell.product = product
//        cell.buyButtonHandler = { product in
//            ProductsDLC.store.buyProduct(product)
//        }
        cell.newBuyButton()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

//          guard let product = product else { return }
         
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! StoreTableViewCell

        let product = products[indexPath.row]
        ProductsDLC.store.buyProduct(product)
       
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//
//        return ConfigurationStore.productIdentifiers.count
//    }
    
    
}


