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

enum OfferCategory: String, Codable, CaseIterable, Identifiable {
 
    var id: String { rawValue }

    case all = "all"
    case food = "food"
    case superstore = "superstore"
    case transport = "transport"
    case miscellaneous = "miscellaneous"

    var icon: String {
        
        switch self {
            
        case OfferCategory.food:
            return "foodIcon"
            
        case OfferCategory.transport:
            return "transportIcon"
            
        case OfferCategory.superstore:
            return "superstoreIcon"
            
        case OfferCategory.all:
            
            return "offerIcon"
            
        default:
            return "miscellaneousIcon"
        }
    }
    
    var color: UIColor {
        
        switch self {
            
        case OfferCategory.food:
            return UIColor(named: "NHS_Pink")!
            
        case OfferCategory.transport:
            return UIColor(named: "NHS_Orange")!
            
        case OfferCategory.superstore:
            return UIColor(named: "NHS_Purple")!
            
        case OfferCategory.all:
            
            return UIColor(named: "NHS_Green")!
            
        default:
            return UIColor(named: "NHS_Turquoise")!
        }
    }
}

class CategoryState: ObservableObject {
    
    @Published var categoryType: OfferCategory = OfferCategory.all
}
