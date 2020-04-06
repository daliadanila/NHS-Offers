//
//  OfferListView.swift
//  NHS Offers
//
//  Created by Dalia on 05/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

struct OfferListView: View {
    
    @EnvironmentObject var categoryState : CategoryState
    
    var body: some View {
        
        List(filteredOffers, id: \.id) { offer in
            NavigationLink(destination: OfferDetailsView()) {
                OfferRowView(offer: offer)
            }
        }
        
    }
    
    var filteredOffers: [OfferRowViewModel] {
        
        switch categoryState.categoryType {
            
        case "offer":
            return TestData.allOffers()
        case "food":
            return TestData.foodOffers()
        case "transport":
            return TestData.transportOffers()
        case "miscellaneous":
            return TestData.miscOffers()
        case "superstore":
            return TestData.superstoreOffers()
        default:
            return TestData.allOffers()
        }
    }
}

struct OfferListView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ForEach(["iPhone SE", "iPhone XS Max", "iPad Pro (11-inch)"], id: \.self) { deviceName in
            OfferListView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}
