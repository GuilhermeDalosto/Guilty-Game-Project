//
//  Products.swift
//  GuiltyGameProject
//
//  Created by Igor de Castro on 10/12/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation

public struct ProductsDLC {
  
    public static let SwiftShopping = "br.com.deck_food.guilty"
  
    private static let productIdentifiers: Set<ProductIdentifier> = [ProductsDLC.SwiftShopping]

    public static let store = StoreDLC(productIds: ProductsDLC.productIdentifiers)
}

func resourceNameForProductIdentifier(_ productIdentifier: String) -> String? {
  return productIdentifier.components(separatedBy: ".").last
}
