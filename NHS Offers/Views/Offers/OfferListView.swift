//
//  OfferListView.swift
//  NHS Offers
//
//  Created by Dalia on 05/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

struct OfferListView: View {
    
    var body: some View {
        
        List(TestData.foodOffers(), id: \.id) { offer in
            OfferRowView(offer: offer)
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
