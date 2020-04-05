//
//  CategoryView.swift
//  NHS Offers
//
//  Created by Dalia on 05/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

struct CategoryView: View {

  let category: CategoryViewModel

  var body: some View {

      Image(category.name)

        .frame(width: 110, height: 100)
        
        .cornerRadius(8)
        
        .overlay(CategoryOverlay(image: category.icon, backgroundColor: category.color)) //Color("PrimaryBlue")
        
        .overlay(NameOverlay(name: category.name))
        
        .gesture(
            TapGesture()
                .onEnded { _ in
                    
            }
    )
    }
}

struct CategoryView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let offerCategories = TestData.offerCategories()
        
        return CategoryView(category: offerCategories[0])
    }
}
