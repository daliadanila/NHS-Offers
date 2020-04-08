//
//  OfferDetailsView.swift
//  NHS Offers
//
//  Created by Dalia on 06/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

struct OfferDetailsView: View {
    
    @ObservedObject var offerDetailsVM: OfferDetailsViewModel
    
    @State private var showShareSheet = false
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            ZStack(alignment: .topLeading) {
                
                CategoryOverlay(image: offerDetailsVM.offer.type.icon, backgroundColor: offerDetailsVM.offer.type.color)
                
                NameOverlay(name: offerDetailsVM.offer.title, alignment: .center, font: .title)
                    .background(Color(UIColor.clear))
                
            }
                
            .edgesIgnoringSafeArea(.top)
                
            .frame(height: 100.0)
            
            
            Text(offerDetailsVM.offer.details)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding([.top, .leading], 10)
                .padding(.trailing, 10)
                .padding(20.0)
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    
                    self.showShareSheet = true
                    
                }) {
                    ButtonView(title: "Share", icon: "square.and.arrow.up")
                    
                }
                .sheet(isPresented: $showShareSheet) {
                    ShareSheet(activityItems: [self.offerDetailsVM.offer.url])
                }
                
                Spacer()
                
                Button(action: {
                    
                    if let url = URL(string: self.offerDetailsVM.offer.url) {
                        UIApplication.shared.open(url)
                    }
                    
                }) {
                    ButtonView(title: "Get deal", icon: "link")
                    
                }
                
                Spacer()
                
                
            }
            
            Spacer()
            
        }
            
        .background(Color(UIColor.init(rgb: 0xF2F2F7)))
    }
}

struct OfferDetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let offer = Offer(id: 2, details: "details", url: "https://www.google.com", title: "Transport title", type: OfferCategory.food)
        
        let offerDetailsVM = OfferDetailsViewModel(offer: offer)
        
        return OfferDetailsView(offerDetailsVM: offerDetailsVM)
    }
}
