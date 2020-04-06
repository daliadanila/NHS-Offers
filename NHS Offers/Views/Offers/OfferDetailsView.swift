//
//  OfferDetailsView.swift
//  NHS Offers
//
//  Created by Dalia on 06/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

struct OfferDetailsView: View {
    
    var body: some View {
        
        VStack {
            
            Text("Marks & Spencer")
                .font(.title)
                .padding(.leading)
                .padding(.trailing)
                .padding(.bottom)
            
            Text("Priority hours for NHS and emergency services workers – first hour on Tuesday and Friday morning")
                .font(.subheadline)
                .padding(.leading)
                .padding(.trailing)
                .padding(.bottom)
            
                Button(action: {
                    
                    print("Get deal button tapped!")
                }) {
                    ButtonView(title: "Get deal")
                    
                }
                
                Button(action: {
                    
                    print("Share button tapped!")
                    
                }) {
                     ButtonView(title: "Share")
                    
                }
    
             Spacer()
            
            
        }
        .navigationBarTitle(Text("Offer details"))
    }
}

struct OfferDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        OfferDetailsView()
    }
}
