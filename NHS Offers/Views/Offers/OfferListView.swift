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
        
        List {
            
            if offerListVM.offerDetailsViewModels.isEmpty {
                emptySection
            } else {
                offersSection
            }
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        
    }
    

    var emptySection: some View {
      Section {
        Text("No results")
            .foregroundColor(.gray)
      }
    }
    
    var offersSection: some View {
        Section {
            ForEach(offerListVM.offerDetailsViewModels) { offerDetailsVM in
                
                NavigationLink(destination: OfferDetailsView(offerDetailsVM: offerDetailsVM)) {
                    OfferRowView(offerDetailsVM: offerDetailsVM)
                }
            }
        }
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
