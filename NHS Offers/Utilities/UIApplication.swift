//
//  UIApplication.swift
//  NHS Offers
//
//  Created by Dalia on 10/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    func endEditing() {
        
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    static var appUnitID: String? {

        #if DEBUG
            return Bundle.main.object(forInfoDictionaryKey: "AdMob_AppUnitID_Debug") as? String
        #else
            return Bundle.main.object(forInfoDictionaryKey: "AdMob_AppUnitID_Live") as? String
        #endif
        
    }
}
