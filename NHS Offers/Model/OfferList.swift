//
//  OfferList.swift
//  NHS Offers
//
//  Created by Dalia on 06/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

enum OfferCategory: String, Codable {
    
    case food = "food"
    case miscellaneous = "miscellaneous"
    case other = "other"
    case transport = "transport"
    case superstore = "superstore"
}

struct OfferList: Codable {
    
    var offers: [OfferCategory: Offer]
    
}

