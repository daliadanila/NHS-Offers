//
//  Offer.swift
//  NHS Offers
//
//  Created by Dalia on 06/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Offer: Codable, Identifiable {
    
    var id: Int
    var details: String
    var url: String
    var title: String
    var type: OfferCategory
    @ServerTimestamp var timestamp: Timestamp?
}

