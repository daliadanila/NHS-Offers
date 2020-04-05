//
//  CategoryOverlay.swift
//  NHS Offers
//
//  Created by Dalia on 05/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

struct CategoryOverlay: View {
    
    let image: String
    
    let backgroundColor: Color
    
    let colors: [Color]
    
    var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: colors),
                       startPoint: .topLeading, endPoint: .bottomLeading)
    }
    
    init(image: String, backgroundColor: Color) {
        
        self.image = image
        
        self.backgroundColor = backgroundColor
        
        self.colors = [self.backgroundColor.opacity(0.9), backgroundColor.opacity(0.6)]
    }
    
    var body: some View {
        
        // ZStack - places views above each other
        ZStack(alignment: .bottomLeading) {
            
            // create a rectagular gradient from topleading edge to center edge
            Rectangle().fill(gradient).cornerRadius(8)
            
            IconView(image: image, size: 20, overlaySize: 30, backgroundColor: backgroundColor)
                .padding(.leading, 10)
                .padding(.bottom, 10)
        }
    }
}

struct CategoryOverlay_Previews: PreviewProvider {
    
    static var previews: some View {
        
        return CategoryOverlay(image: "food", backgroundColor: .red)
    }
}

