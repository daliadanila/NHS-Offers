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

        .frame(width: 110, height: 90) // image frame
        // create outer view with border (color, width)
       // .border(category.color.opacity(0.5), width: 0.5)
        // apply cornerRadius to hide visible cut out
        .cornerRadius(8)
        
        // for creating dark shadow behind the image
        .overlay(CategoryOverlay(image: category.icon, backgroundColor: category.color))
        
        // for creating dark shadow behind the text
        .overlay(NameOverlay(name: category.name))
    }
}

struct CategoryView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let offerCategories = TestData.offerCategories()
        
        return CategoryView(category: offerCategories[0])
    }
}
