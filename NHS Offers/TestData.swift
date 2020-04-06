//
//  TestData.swift
//  NHS Offers
//
//  Created by Dalia on 05/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import UIKit

struct TestData {
    
    static func offerCategories() -> [CategoryViewModel] {
        
        let cat1 = CategoryViewModel(name: "All Offers", icon: "offer", color: UIColor(rgb: 0x003459))//UIColor.systemBlue)
        let cat2 = CategoryViewModel(name: "Food Offers", icon: "food", color: UIColor(rgb: 0xEC7D10)) //UIColor.systemRed)
        let cat3 = CategoryViewModel(name: "Transport Offers", icon: "transport", color: UIColor(rgb: 0xC200FB)) //color: UIColor.systemIndigo)
        let cat4 = CategoryViewModel(name: "Superstore Offers", icon: "superstore", color: UIColor(rgb: 0xD90368))//UIColor.orange)
        let cat5 = CategoryViewModel(name: "Miscellaneous Offers", icon: "miscellaneous", color: UIColor(rgb: 0xB370B0))//UIColor.purple)
        return [cat1, cat2, cat3, cat4, cat5]
    }
    
    static func foodOffers() -> [OfferRowViewModel] {
        
        let offer1 = OfferRowViewModel(title: "Cook 19", description: "Providing free meals to NHS staff via waiting list system.", icon: "food", color: .red)
        let offer2 = OfferRowViewModel(title: "DG Cars Nottingham", description: "Free bread and milk for NHS staff and elderly.", icon: "food", color: .red)
        let offer3 = OfferRowViewModel(title: "Dominos", description: "Free medium pizza, delivery only.", icon: "food", color: .red)
        let offer4 = OfferRowViewModel(title: "Just Eat", description: "25% discount on takeaway and delivery, until April 13.", icon: "food", color: .red)
        let offer5 = OfferRowViewModel(title: "LEON", description: "50% discount to NHS workers, restaurants also now selling supermarket supplies.", icon: "food", color: .red)
        
        return [offer1, offer2, offer3, offer4, offer5]
    }
}
