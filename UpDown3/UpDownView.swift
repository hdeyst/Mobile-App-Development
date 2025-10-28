//
//  ContentView.swift
//  UpDown3
//
//  Created by Hannah Deyst on 10/23/25.
//

import SwiftUI

struct UpDownView: View {
    @EnvironmentObject var stringInfo: StringInfo
    @EnvironmentObject var navControl: NavControl
    @State private var string = "ABCDEF"
    
    var body: some View {
        VStack {
            Spacer()
            Text("UpDown3").font(.system(size: 36))
            Spacer()
            
            Text("\(stringInfo.curChar)").font(.system(size: 64))
                .foregroundStyle(stringInfo.curColor)
            Spacer()
            HStack {
                Spacer()
                
                // move right (->) through string
                Button(action: stringInfo.increment
                ) {Text("\u{2191}").font(.system(size: 48))}
                Spacer()
                
                // move left (<-) through string
                Button(action: stringInfo.decrement
                ) {Text("\u{2193}").font(.system(size: 48))}
                Spacer()
                
            }
            Spacer()
            RoundedButtonView(buttonText: "Settings", action: navControl.toggle)
        }
    }
    
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

#Preview {
    UpDownView()
        .environmentObject(StringInfo(characters: "ABCDEF", curColor: .black))
        .environmentObject(NavControl())
}

