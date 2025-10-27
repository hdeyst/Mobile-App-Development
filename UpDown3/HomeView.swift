//
//  HomeView.swift
//  UpDown3
//
//  Created by Hannah Deyst on 10/23/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var navControl: NavControl
  
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                UpDownView(navControl: NavControl())
                RoundedButtonView(buttonText: "Settings", action: navControl.toggle)
                Spacer()
                
            }.navigationDestination(isPresented: $navControl.showSettings) {SettingsView(navControl: NavControl())}
                .navigationBarBackButtonHidden()
                .padding()
        }
    }
}

#Preview {
    HomeView(navControl: NavControl()).environmentObject(StringInfo(characters: "ABCDEF", curColor: .black))
}

