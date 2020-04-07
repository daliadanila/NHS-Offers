//
//  CategoryViewModel.swift
//  NHS Offers
//
//  Created by Dalia on 05/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI
import Foundation

struct CategoryViewModel: Identifiable {

    var id: String = UUID().uuidString
    
    let type: OfferCategory
    
    init(type: OfferCategory) {
        
        self.type = type
    }
}
