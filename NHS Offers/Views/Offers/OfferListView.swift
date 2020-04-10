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
    
    @ObservedObject var offerListVM : OfferListViewModel
    
    @Binding var searchText : String 
    
    var body: some View {
        VStack {
            
            List {
                
                if filteredOffers.isEmpty {
                    
                    emptySection
                }
                else {
                    
                    offersSection
                }
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
        }
        
    }
    
    var emptySection: some View {
        Section {
            Text("No results")
                .foregroundColor(.gray)
        }
    }
    
    var offersSection: some View {
        
        Section {
            
            ForEach(filteredOffers)
            {
                offerDetailsVM in
                
                NavigationLink(destination: OfferDetailsView(offerDetailsVM: offerDetailsVM)) {
                    OfferRowView(offerDetailsVM: offerDetailsVM)
                }
                
            }
            
        }
    }
    
    var filteredOffers: [OfferDetailsViewModel] {
        
        return offerListVM.offerDetailsViewModels.filter {
        
        self.searchText.isEmpty ?
            (self.categoryState.categoryType != OfferCategory.all ? ($0.offer.type == self.categoryState.categoryType) : true)
            :
            $0.offer.title.lowercased().contains(self.searchText.lowercased())
        
        }
    }
}

//struct OfferListView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        
//        ForEach(["iPhone SE", "iPhone XS Max", "iPad Pro (11-inch)"], id: \.self) { deviceName in
//            
//            OfferListView(offerListVM: OfferListViewModel())
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
//    }
//}
