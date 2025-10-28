//
//  NavControl.swift
//  UpDown3
//
//  Created by Hannah Deyst on 10/24/25.
//

import SwiftUI

class NavControl: ObservableObject {
    @Published var showSettings = false
    
    func toggle() {
        showSettings = !showSettings
        print("toggling showsettings, value now is: \(showSettings)")
    }
    
    func goToSettings() {
        showSettings = true
    }
    
    func goToUpdown() {
        showSettings = false
    }
    
}
