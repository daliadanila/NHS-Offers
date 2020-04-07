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

class OfferListViewModel: ObservableObject {
    
  @Published var offerRepository: OfferRepository = Resolver.resolve()
 // @Published var taskCellViewModels = [TaskCellViewModel]()
  
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    
    offerRepository.$offers.map { offers in
      offers.map { offer in
     //   OfferRowViewModel(offer: offer)
      }
    }
//    .assign(to: \.taskCellViewModels, on: self)
//    .store(in: &cancellables)
  }

}
