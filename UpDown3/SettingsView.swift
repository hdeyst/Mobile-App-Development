//
//  SettingsView.swift
//  UpDown3
//
//  Created by Hannah Deyst on 10/23/25.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var stringInfo: StringInfo
    @ObservedObject var navControl: NavControl
    @State private var tempTextField = " "
    @State private var raiseError = false
    @State private var bc: Color = .blue
    
    var body: some View {
        NavigationStack {
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
                if raiseError {
                    Text("Text cannot be empty").font(.system(size: 28))
                        .foregroundStyle(.red)
                } else {
                    Text(" ")
                }
                Spacer()
                RoundedButtonView(buttonText: "Save", action: saveString, buttonColor: bc)
                    .disabled(tempTextField == "")
                RoundedButtonView(buttonText: "Cancel", action: navControl.toggle)
            }
        }.onChange(of: tempTextField) {
            check()
        }
        .padding()
            .navigationDestination(isPresented: $navControl.showSettings) {UpDownView(navControl: NavControl())}
            .navigationBarBackButtonHidden()
            .padding()
            .environmentObject(navControl)
    }
    func check() {
        if tempTextField == "" {
            raiseError = true
            bc = .gray
        } else {
            raiseError = false
            bc = .blue
        }
    }
    
    func saveString() {
        stringInfo.changeString(str: tempTextField)
    }

}

#Preview {
    SettingsView(navControl: NavControl())
        .environmentObject(StringInfo(characters: "ABCDEF", curColor: .black))
}
