//
//  OfferListViewModel.swift
//  NHS Offers
//
//  Created by Dalia on 06/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import Foundation
import Combine
import Resolver
import SwiftUI

class OfferListViewModel: ObservableObject {
    
    @Published var offerRepository: OfferRepository = Resolver.resolve()
    
    @Published var offerRowViewModels = [OfferRowViewModel]()
    
    var categoryState : CategoryState
    
    private var cancellables = Set<AnyCancellable>()
    
    init(categoryState: CategoryState) {
        
        self.categoryState = categoryState
        
        offerRepository.$offers
            .map { offers in
                offers
                    .filter {
                        self.categoryState.categoryType != OfferCategory.all ? ($0.type == self.categoryState.categoryType) : true }
                    
                    .map { offer in OfferRowViewModel(offer: offer)
                }
        }
        .assign(to: \.offerRowViewModels, on: self)
            
        .store(in: &cancellables)
    }
    
}
