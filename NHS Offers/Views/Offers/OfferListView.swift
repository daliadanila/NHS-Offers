//
//  OfferListView.swift
//  NHS Offers
//
//  Created by Dalia on 05/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

struct OfferListView: View {
    
    @ObservedObject var offerListVM : OfferListViewModel
    
    var body: some View {
        
        List(offerListVM.offerRowViewModels) { offerRowVM in
            NavigationLink(destination: OfferDetailsView()) {
                OfferRowView(offerRowVM: offerRowVM)
            }
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        
    }
}

//struct OfferListView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        
//        ForEach(["iPhone SE", "iPhone XS Max", "iPad Pro (11-inch)"], id: \.self) { deviceName in
//            OfferListView()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//            .previewDisplayName(deviceName)
//        }
//    }
//}
