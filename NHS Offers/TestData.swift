//
//  TestData.swift
//  NHS Offers
//
//  Created by Dalia on 05/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import UIKit
import SwiftUI

struct TestData {
    
    static func offerCategories() -> [CategoryViewModel] {
        
        let cat1 = CategoryViewModel(name: "All Offers", icon: "offer", color: UIColor(rgb: 0x006747))//UIColor.systemBlue)
        let cat2 = CategoryViewModel(name: "Food Offers", icon: "food", color: UIColor(rgb: 0xAE2573)) //UIColor.systemRed)
        let cat3 = CategoryViewModel(name: "Transport Offers", icon: "transport", color: UIColor(rgb: 0xED8B00)) //color: UIColor.systemIndigo)
        let cat4 = CategoryViewModel(name: "Superstore Offers", icon: "superstore", color: UIColor(rgb: 0x330072))//UIColor.orange)
        let cat5 = CategoryViewModel(name: "Miscellaneous Offers", icon: "miscellaneous", color: UIColor(rgb: 0x00A499))//UIColor.purple)
        return [cat1, cat2, cat3, cat4, cat5]
    }
    
    static func foodOffers() -> [OfferRowViewModel] {
        
        let offer1 = OfferRowViewModel(title: "Cook 19", description: "Providing free meals to NHS staff via waiting list system.", icon: "food", color: Color(UIColor(rgb: 0xAE2573)))
        let offer2 = OfferRowViewModel(title: "DG Cars Nottingham", description: "Free bread and milk for NHS staff and elderly.", icon: "food", color: Color(UIColor(rgb: 0xAE2573)))
        let offer3 = OfferRowViewModel(title: "Dominos", description: "Free medium pizza, delivery only.", icon: "food", color: Color(UIColor(rgb: 0xAE2573)))
        let offer4 = OfferRowViewModel(title: "Just Eat", description: "25% discount on takeaway and delivery, until April 13.", icon: "food", color: Color(UIColor(rgb: 0xAE2573)))
        let offer5 = OfferRowViewModel(title: "LEON", description: "50% discount to NHS workers, restaurants also now selling supermarket supplies.", icon: "food", color: Color(UIColor(rgb: 0xAE2573)))
        
        return [offer1, offer2, offer3, offer4, offer5]
    }
    
    static func superstoreOffers() -> [OfferRowViewModel] {
        
        let offer1 = OfferRowViewModel(title: "Title1", description: "Description", icon: "superstore", color: Color(UIColor(rgb: 0x330072)))
        let offer2 = OfferRowViewModel(title: "Title2", description: "Description", icon: "superstore", color: Color(UIColor(rgb: 0x330072)))
        let offer3 = OfferRowViewModel(title: "Title3", description: "Description", icon: "superstore", color: Color(UIColor(rgb: 0x330072)))
        let offer4 = OfferRowViewModel(title: "Title4", description: "Description", icon: "superstore", color: Color(UIColor(rgb: 0x330072)))
        
        return [offer1, offer2, offer3, offer4]
    }
    
    static func transportOffers() -> [OfferRowViewModel] {
        
        let offer2 = OfferRowViewModel(title: "Uber", description: "Uber free rides", icon: "transport", color: Color(UIColor(rgb: 0xED8B00)))
        
        return [offer2]
    }
    
    static func miscOffers() -> [OfferRowViewModel] {
        
        let offer2 = OfferRowViewModel(title: "Title", description: "Description", icon: "miscellaneous", color: Color(UIColor(rgb: 0x00A499)))
        
        return [offer2]
    }
    
    static func allOffers() -> [OfferRowViewModel] {
        
        var allOffers = TestData.foodOffers()
        
        allOffers.append(contentsOf: TestData.superstoreOffers())
        
        allOffers.append(contentsOf: transportOffers())
        
        allOffers.append(contentsOf: miscOffers())
        
        return allOffers
    }
}
