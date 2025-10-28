//
//  SettingsView.swift
//  UpDown3
//
//  Created by Hannah Deyst on 10/23/25.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var stringInfo: StringInfo
    @EnvironmentObject var navControl: NavControl
    @State private var tempTextField = " "
    
    var body: some View {

        VStack {
            Text("Settings").font(.title)
            Spacer()
            Text("Text to display:").font(.title2)
            TextField("blahblahblah", text: $tempTextField)
                .textInputAutocapitalization(.never)
                .frame(width: 300, height: 70)
                .border(Color.black, width: 1)
                .font(.system(size: 64))
                .multilineTextAlignment(.center)
                .onAppear() {tempTextField = stringInfo.characters}
            Spacer()
            RoundedButtonView(buttonText: "Save", action: saveString).disabled(tempTextField == "")
            RoundedButtonView(buttonText: "Cancel", action: navControl.toggle)
        }.padding()
        .navigationDestination(isPresented: $navControl.showSettings) {HomeView()}

    }
    
    func saveString() {
        stringInfo.changeString(str: tempTextField)
    }

}

#Preview {
    SettingsView()
        .environmentObject(StringInfo(characters: "ABCDEF", curColor: .black))
        .environmentObject(NavControl())
}
