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
    
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(StringInfo(characters: "ABCDEF", curColor: .black))
        }
    }
}
