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
    
    init() {

         UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white]

    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                ZStack {
                    
                    Rectangle()
                        .frame(height: 280)
                        .edgesIgnoringSafeArea(.top)
                        .foregroundColor(.blue)
                    
                    ScrollView(.horizontal, content: {
                        HStack(alignment: .top, spacing: 10) {
                            
                            ForEach(offerCategories) { category in
                                
                                CategoryView(category: category)
                            }
                                
                        }
                    })
                        
                        
                        .frame(height: 50)
                        .padding(.leading, 10)
                        .padding(.bottom, 150)
                        
                        .navigationBarTitle(Text("NHS Offers"))
                }
                
                OfferListView()
                .padding(.top, -140)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        // ,"iPhone 8", "iPhone XS Max"
        
        ForEach(["iPhone SE", "iPhone 8","iPhone XS Max", "iPhone 11 Pro Max"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
