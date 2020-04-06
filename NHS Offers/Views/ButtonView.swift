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
    
    init(title: String) {
        
        self.title = title
        
    }
    
    var body: some View {
        
        Text(self.title)
        .padding()
        .background(Color.red)
        .foregroundColor(.white)
        .font(.body)
        .multilineTextAlignment(.center)
        .padding(.top)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Test")
    }
}
