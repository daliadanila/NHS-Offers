//
//  NameOverlay.swift
//  NHS Offers
//
//  Created by Dalia on 05/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import SwiftUI

struct NameOverlay: View {
    

    let name: String

    let colors: [Color] = [Color.clear.opacity(1), Color.clear.opacity(1)]
    
    var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: colors),
                       startPoint: .bottomLeading, endPoint: .center)
    }
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            Rectangle().fill(gradient).cornerRadius(8)
            
            Text(name)
                .font(.footnote)
                .bold()
                .multilineTextAlignment(.leading)
                .padding(10)
        }
        .foregroundColor(.white)
    
    }
}

struct NameOverlay_Previews: PreviewProvider {
    
    static var previews: some View {
        
        return NameOverlay(name: "Food")
    }
}
