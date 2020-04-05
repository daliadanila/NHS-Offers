//
//  IconView.swift
//  NHS Offers
//
//  Created by Dalia on 05/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

struct IconView: View {
    
    let image: String
    
    let size: CGFloat
    
    let overlaySize: CGFloat
    
    let backgroundColor: Color
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .frame(width: overlaySize, height: overlaySize)
                .foregroundColor(backgroundColor)
                .cornerRadius(overlaySize/2)
            
            Image(image)
                .resizable()
                .frame(width: size, height: size)
        }
        
    }
}


struct IconView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        return IconView(image: "food", size: 20, overlaySize: 30, backgroundColor: .blue)
    }
}
