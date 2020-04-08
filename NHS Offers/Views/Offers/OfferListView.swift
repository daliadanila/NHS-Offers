//
//  OfferListView.swift
//  NHS Offers
//
//  Created by Dalia on 05/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI
import SwiftUIRefresh

struct OfferListView: View {
    
    @ObservedObject var offerListVM : OfferListViewModel
    
    @State private var isShowing = false
    
    var body: some View {
        
        List(offerListVM.offerDetailsViewModels) { offerDetailsVM in
            NavigationLink(destination: OfferDetailsView(offerDetailsVM: offerDetailsVM)) {
                OfferRowView(offerDetailsVM: offerDetailsVM)
            }
        }
        .pullToRefresh(isShowing: $isShowing) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isShowing = false
            }
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        
    }
}

struct OfferListView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ForEach(["iPhone SE", "iPhone XS Max", "iPad Pro (11-inch)"], id: \.self) { deviceName in
            
            OfferListView(offerListVM: OfferListViewModel(categoryState: CategoryState()))
                .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}
