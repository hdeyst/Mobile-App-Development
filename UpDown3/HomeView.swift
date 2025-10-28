//
//  HomeView.swift
//  UpDown3
//
//  Created by Hannah Deyst on 10/23/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var navControl = NavControl()
  
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                UpDownView().environmentObject(navControl)
                Spacer()
                
            }
        }.navigationDestination(isPresented: $navControl.showSettings) {SettingsView()}
                .navigationBarBackButtonHidden()
                .padding()
        
    }
}

#Preview {
    HomeView()
        .environmentObject(StringInfo(characters: "ABCDEF", curColor: .black))
        .environmentObject(NavControl())
}

