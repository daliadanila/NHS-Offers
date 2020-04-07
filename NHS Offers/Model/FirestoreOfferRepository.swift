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

protocol OfferRepository: BaseOfferRepository {

    
}

class FirestoreOfferRepository: BaseOfferRepository, OfferRepository, ObservableObject {
    
    var db = Firestore.firestore()
    
    override init() {
        
        super.init()
        
        loadData()
    }
    
  private func loadData() {
    
    let db = Firestore.firestore()
    
    let docRef = db.collection("nhs")
    
    db.collection("testCollection").getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            
            for document in querySnapshot!.documents {
                print("\(document.documentID) => \(document.data())")
                
                if let offer = try?  document.data(as: Offer.self) {
                    
                    self.offers.append(offer)
                }
            }
        }
    }
    
//    db.collection("tasks").order(by: "createdTime").addSnapshotListener { (querySnapshot, error) in // (2)
//      if let querySnapshot = querySnapshot {
//        self.tasks = querySnapshot.documents.compactMap { document -> Task? in // (3)
//          try? document.data(as: Task.self) // (4)
//        }
//      }
//    }
  }

}
