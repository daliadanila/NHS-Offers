//
//  UIApplication+Editing.swift
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
    
    static var appUnitID_Debug: String? {
        
        return Bundle.main.object(forInfoDictionaryKey: "AdMob_AppUnitID_Debug") as? String
    }
    
    static var appUnitID_Live: String? {
        
        return Bundle.main.object(forInfoDictionaryKey: "AdMob_AppUnitID_Live") as? String
    }
}
