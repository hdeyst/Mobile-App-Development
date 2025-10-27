//
//  UpDown3App.swift
//  UpDown3
//
//  Created by Hannah Deyst on 10/23/25.
//

import SwiftUI

@main
struct UpDown3App: App {
    @EnvironmentObject var stringInfo: StringInfo
    @StateObject var navControl = NavControl()
    
    var body: some Scene {
        WindowGroup {
            HomeView(navControl: NavControl())
        }
    }
}
