//
//  FirestoreOfferRepository.swift
//  NHS Offers
//
//  Created by Dalia on 06/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import Foundation
import Firebase
import Resolver
import Combine

class BaseOfferRepository {
    
    @Published var offers = [Offer]()
}

protocol OfferRepository: BaseOfferRepository { }

class FirestoreOfferRepository: BaseOfferRepository, OfferRepository, ObservableObject {
    
    var db = Firestore.firestore()
    
    @Injected var authenticationService: AuthenticationService
    
    var userId: String = "unknown"
    
    private var listenerRegistration: ListenerRegistration?
    
    private var cancellables = Set<AnyCancellable>()
    
    override init() {
        super.init()
        
        authenticationService.$user
            .compactMap { user in
                user?.uid
        }
        .assign(to: \.userId, on: self)
        .store(in: &cancellables)
        
        // (re)load data if user changes
        authenticationService.$user
            .receive(on: DispatchQueue.main)
            .sink { user in
                self.loadData()
        }
        .store(in: &cancellables)
    }
    
    private func loadData() {
        
     //   loadCollectionWithName(collectionName: "nhs")
        
        loadCollectionWithName(collectionName: "testCollection")
    }
    
    private func loadCollectionWithName(collectionName: String) {
        
        if listenerRegistration != nil {
            listenerRegistration?.remove()
        }
        
        listenerRegistration =
            
            db.collection(collectionName)
            .order(by: "timestamp")
            .addSnapshotListener { (querySnapshot, error) in
                
                if let error = error {
                    
                    print("Error getting documents: \(error)")
                    
                } else {
                    
                    if let querySnapshot = querySnapshot {
                        
                        self.offers.append(contentsOf: querySnapshot.documents.compactMap { document -> Offer? in
                            
                            try? document.data(as: Offer.self)
                        })
                    }
                }
        }
    }
    
}
