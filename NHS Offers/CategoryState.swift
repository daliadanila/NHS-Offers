//
//  CategoryState.swift
//  NHS Offers
//
//  Created by Dalia on 06/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import Foundation

class CategoryState: ObservableObject {
    
    @Published var categoryType: OfferCategory = OfferCategory.food
}
