//
//  RoundedButtonView.swift
//  UpDown3
//
//  Created by Hannah Deyst on 10/24/25.
//


import SwiftUI

struct RoundedButtonView: View {
  var buttonText: String = ""
  var action: () -> Void
  var width: CGFloat = 200
  var height: CGFloat = 60
  var buttonColor = Color.blue

  var body: some View {
    Button(action: action) {
      Text(buttonText)
        .font(.title)
        .frame(width: width, height: height) .foregroundColor(buttonColor) .overlay(RoundedRectangle(cornerRadius: 25)
          .stroke(buttonColor, lineWidth: 2))
        .cornerRadius(25)
    }
  }
}

#Preview {
  RoundedButtonView(buttonText: "Next", action: {})
}
