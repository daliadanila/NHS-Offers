//
//  CategoryOverlay.swift
//  NHS Offers
//
//  Created by Dalia on 05/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI
import UIKit

struct CategoryOverlay: View {
    
    let image: String
    
    let backgroundColor: UIColor
    
    let colors: [Color]
    
    var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: colors),
                       startPoint: .topLeading, endPoint: .bottomLeading)
    }
    
    init(image: String, backgroundColor: UIColor) {
        
        self.image = image
        
        self.backgroundColor = backgroundColor
        
        let darkColor = self.backgroundColor
        
        let lightColor = darkColor.lighter(amount: 0.8)
        
        self.colors = [Color(darkColor),
                       Color(lightColor)]
    }
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            
            Rectangle().fill(gradient).cornerRadius(8)
            
            IconView(image: image, size: 18, overlaySize: 30, backgroundColor: Color(backgroundColor))
                .padding(.leading, 10)
                .padding(.bottom, 10)
        }
    }
}

struct CategoryOverlay_Previews: PreviewProvider {
    
    static var previews: some View {
        
        return CategoryOverlay(image: "food", backgroundColor: .systemRed)
    }
}

