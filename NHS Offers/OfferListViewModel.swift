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
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        
//        offerRepository.$offers
//            .map { offers in
//                offers
//                    .map { offer in OfferRowViewModel(offer: offer)
//            }
//        }
//        .assign(to: \.offerRowViewModels, on: self)
//
//        .store(in: &cancellables)
//
        offerRepository.$offers
            .map { offers in
                offers
                    .filter {

                       // print("---> \(self.categoryState.categoryType)")

                        $0.type == OfferCategory.transport }
                    .map { offer in OfferRowViewModel(offer: offer)
            }
        }
        .assign(to: \.offerRowViewModels, on: self)

        .store(in: &cancellables)
    }
    
}
