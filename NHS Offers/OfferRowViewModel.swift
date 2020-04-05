//
//  OfferRowViewModel.swift
//  NHS Offers
//
//  Created by Dalia on 05/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI
import Foundation

struct OfferRowViewModel: Identifiable {

    var id: String = UUID().uuidString
    
    let title: String
    
    let description: String
    
    let icon: String
    
    let color: Color
    
    
    init(title: String, description: String, icon: String, color: Color) {
        
        self.title = title
        
        self.description = description
        
        self.icon = icon
        
        self.color = color
    }
}

extension OfferRowViewModel {
    
    var image: Image {
        
        Image(icon)
    }
}
