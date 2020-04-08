//
//  HostingController.swift
//  NHS Offers
//
//  Created by Dalia on 08/04/2020.
//  Copyright © 2020 Artemis Simple Solutions Ltd. All rights reserved.
//

import Foundation

import SwiftUI

final class HostingController<T: View>: UIHostingController<T> {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        .lightContent
    }
}
