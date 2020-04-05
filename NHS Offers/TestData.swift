//
//  TestData.swift
//  NHS Offers
//
//  Created by Dalia on 05/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import Foundation

struct TestData {
    
    static func offerCategories() -> [CategoryViewModel] {
        
        let cat1 = CategoryViewModel(name: "All Offers", icon: "offer", color: .blue)
        let cat2 = CategoryViewModel(name: "Food", icon: "food", color: .red)
        let cat3 = CategoryViewModel(name: "Transport", icon: "transport", color: .green)
        let cat4 = CategoryViewModel(name: "Superstores", icon: "superstore", color: .orange)
        let cat5 = CategoryViewModel(name: "Miscellaneous", icon: "miscellaneous", color: .purple)
        return [cat1, cat2, cat3, cat4, cat5]
    }
}
