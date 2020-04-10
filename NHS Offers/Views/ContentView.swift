//
//  ContentView.swift
//  NHS Offers
//
//  Created by Dalia on 05/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI
import Resolver
import Foundation

struct ContentView: View {
    
    let categories = OfferCategory.allCases
    
    @EnvironmentObject var categoryState : CategoryState
    
    @State private var searchText : String = ""
    
    @State private var adLoaded = false
    
    init() {
        
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().tintColor = .white
        
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.blue)
                        .edgesIgnoringSafeArea(.top)
                    
                    SearchBar(text: $searchText, placeholder: "Search offers")
                }
                .frame(height: 50)
                
                ZStack {
                    
                    Rectangle()
                        .frame(height: 250)
                        .foregroundColor(.blue)
                        .padding(.top, -10)
                    
                    ScrollView(.horizontal, content: {
                        HStack(alignment: .top, spacing: 10) {
                            
                            ForEach(categories) { category in
                                
                                CategoryView(category: category, searchText: self.$searchText)
                            }
                            
                        }
                    })
                        .frame(height: 50)
                        .padding(.leading, 10)
                        .padding(.bottom, 150)
                        .navigationBarTitle(Text("NHS Offers"))
                }
                
                OfferListView(offerListVM: OfferListViewModel(), searchText: $searchText)
                    .padding(.top, -140)
                    .onAppear {
                        
                        self.searchText = ""
                        
                        UIApplication.shared.endEditing()
                }
                
                AdView()
                    .frame(height: 50)
            }
        }
            
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        // ,"iPhone 8", "iPhone XS Max"
        
        ForEach(["iPhone SE", "iPhone 8","iPhone XS Max", "iPhone 11 Pro Max"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
                .environmentObject(CategoryState())
        }
    }
}
