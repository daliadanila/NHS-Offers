//
//  ContentView.swift
//  NHS Offers
//
//  Created by Dalia on 05/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    let offerCategories = TestData.offerCategories()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                ScrollView(.horizontal, content: {
                    HStack(alignment: .top, spacing: 10) {
                        
                        ForEach(offerCategories) { category in
                            
                            CategoryView(category: category)
                        }
                            
                    }
                })
                    
                    
                    .frame(height: 130)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    
                    
                    .navigationBarTitle(Text("NHS Offers 🌈"))
                
                OfferListView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ForEach(["iPhone SE","iPhone 8", "iPhone XS Max"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
