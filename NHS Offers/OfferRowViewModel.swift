//
//  OfferRowViewModel.swift
//  NHS Offers
//
//  Created by Dalia on 05/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI
import Combine
import Resolver

class OfferRowViewModel: Identifiable, ObservableObject {

    var id: String = UUID().uuidString
    
    @Published var offer: Offer
    
    @Published var iconName = ""
    
    @Published var iconBackgroundColor = UIColor.white
    
    private var cancellables = Set<AnyCancellable>()
      
    init(offer: Offer) {
        
        self.offer = offer
        
        $offer
            .map { $0.type.icon }
        .assign(to: \.iconName, on: self)
        .store(in: &cancellables)
        
        $offer
            .map { $0.type.color }
        .assign(to: \.iconBackgroundColor, on: self)
        .store(in: &cancellables)
        
    }
}
