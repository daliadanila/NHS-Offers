//
//  ButtonView.swift
//  NHS Offers
//
//  Created by Dalia on 06/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    
    var title: String
    
    var icon: String
    
    init(title: String, icon: String) {
        
        self.title = title
        
        self.icon = icon
    }
    
    var body: some View {
        
        HStack {
            
            Image(systemName: icon)
                .font(.system(size: 18, weight: .semibold))
            
            Text(self.title)
                .fontWeight(.semibold)
            
            
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.blue)
        .cornerRadius(.infinity)
        
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Share", icon: "square.and.arrow.up")
    }
}
