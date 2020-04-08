//
//  OfferRowView.swift
//  NHS Offers
//
//  Created by Dalia on 05/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

struct OfferRowView: View {
    
    @ObservedObject var offerDetailsVM: OfferDetailsViewModel
    
    var body: some View {
        
        HStack {
          
            IconView(image: offerDetailsVM.iconName, size: 18, overlaySize: 30, backgroundColor: Color(offerDetailsVM.iconBackgroundColor))
            
            .padding(.trailing, 5)

            
            VStack(alignment: .leading) {
                HStack {
                    Text(offerDetailsVM.offer.title)
                        .font(.body)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
                
                
                Text(offerDetailsVM.offer.details)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
            }
                
            
        }
    }
}

//struct OfferRowView_Previews: PreviewProvider {
//
//    static var previews: some View {
//
//        Group {
//
//            OfferRowView(offer: TestData.foodOffers()[0])
//
//            OfferRowView(offer: TestData.foodOffers()[1])
//
//        }
//
//        .previewLayout(.fixed(width:300, height: 70))
//    }
//}
