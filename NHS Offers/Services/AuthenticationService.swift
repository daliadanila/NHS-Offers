//
//  AuthenticationService.swift
//  NHS Offers
//
//  Created by Dalia on 13/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import Foundation
import Firebase
import AuthenticationServices
import CryptoKit
import Resolver

class AuthenticationService: ObservableObject {
  
  @Published var user: User?
  
  @LazyInjected private var offerRepository: OfferRepository
  private var handle: AuthStateDidChangeListenerHandle?
  
  init() {
    registerStateListener()
  }
  
  func signIn() {
    if Auth.auth().currentUser == nil {
      Auth.auth().signInAnonymously()
    }
  }
  
    func signOut() {
        do {
            try Auth.auth().signOut()
        }
        catch {
            print("Error when trying to sign out: \(error.localizedDescription)")
        }
    }
    
    private func registerStateListener() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
        self.handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            print("Sign in state has changed.")
            self.user = user
            
            if let user = user {
                let anonymous = user.isAnonymous ? "anonymously " : ""
                print("User signed in \(anonymous)with user ID \(user.uid). Email: \(user.email ?? "(empty)"), display name: [\(user.displayName ?? "(empty)")]")
            }
            else {
                print("User signed out.")
                self.signIn()
            }
        }
    }
}
