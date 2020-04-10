//
//  CategoryView.swift
//  NHS Offers
//
//  Created by Dalia on 05/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

struct CategoryView: View {
    
    let category: OfferCategory
    
    @Binding var searchText : String
    
    @EnvironmentObject var categoryState : CategoryState
    
    var body: some View {
        
        Image("")
            
            .frame(width: 110, height: 100)
            
            .cornerRadius(8)
            
            .overlay(CategoryOverlay(image: category.icon, backgroundColor: category.color)) 
            
            .overlay(NameOverlay(name: category.rawValue.capitalizingFirstLetter() + " Offers", alignment: .topLeading, font: .footnote))
            
            .gesture(
                TapGesture()
                    .onEnded { _ in
                        
                        self.searchText = ""
                        
                        UIApplication.shared.endEditing()
                        
                        self.categoryState.categoryType = self.category
                        
                }
        )
    }
}

//struct CategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        
//        CategoryView(category: OfferCategory.food)
//    }
//}
