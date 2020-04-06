//
//  CategoryViewModel.swift
//  NHS Offers
//
//  Created by Dalia on 05/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI
import Foundation

struct CategoryViewModel: Identifiable {

    var id: String = UUID().uuidString
    
    let name: String
    
    let icon: String

    let color: UIColor
    
    init(name: String, icon: String, color: UIColor) {
        
        self.name = name
        
        self.icon = icon
        
        self.color = color
    }
}
