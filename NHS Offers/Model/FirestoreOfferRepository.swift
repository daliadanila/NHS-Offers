//
//  FirestoreOfferRepository.swift
//  NHS Offers
//
//  Created by Dalia on 06/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import Foundation
import Firebase

class BaseOfferRepository {
    
  @Published var offers = [Offer]()
}

protocol OfferRepository: BaseOfferRepository { }

class FirestoreOfferRepository: BaseOfferRepository, OfferRepository, ObservableObject {
    
    var db = Firestore.firestore()
    
    override init() {
        
        super.init()
        
        loadData()
    }
    
    private func loadData() {
        
        let db = Firestore.firestore()
        
        db.collection("nhs").order(by: "timestamp").addSnapshotListener { (querySnapshot, error) in // (2)
            
            if let error = error {
                
                print("Error getting documents: \(error)")
                
            } else {
                
                if let querySnapshot = querySnapshot {
                    
                    self.offers = querySnapshot.documents.compactMap { document -> Offer? in
                        
                        try? document.data(as: Offer.self)
                    }
                }
            }
        }
        
    }
    
}
