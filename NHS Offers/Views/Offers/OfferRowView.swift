//
//  OfferRowView.swift
//  NHS Offers
//
//  Created by Dalia on 05/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

struct OfferRowView: View {
    
    var offer: OfferRowViewModel
    
    var body: some View {
        
        HStack {
            
            IconView(image: offer.icon, size: 18, overlaySize: 30, backgroundColor: offer.color)
            
            .padding(.trailing, 5)

            
            VStack(alignment: .leading) {
                HStack {
                    Text(offer.title)
                        .font(.body)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
                
                
                Text(offer.description)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
            }
                
            
        }
    }
}

struct OfferRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            
            OfferRowView(offer: TestData.foodOffers()[0])
            
            OfferRowView(offer: TestData.foodOffers()[1])
        
        }
        
        .previewLayout(.fixed(width:300, height: 70))
    }
}
