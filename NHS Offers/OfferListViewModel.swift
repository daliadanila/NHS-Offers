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
    
    @Published var offerDetailsViewModels = [OfferDetailsViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        
        offerRepository.$offers
            .map { offers in
                offers
                    .map { offer in OfferDetailsViewModel(offer: offer)
                }
        }
        .assign(to: \.offerDetailsViewModels, on: self)
            
        .store(in: &cancellables)
    }
    
}
