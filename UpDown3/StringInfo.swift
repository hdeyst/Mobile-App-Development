//
//  StringInfo.swift
//  UpDown3
//
//  Created by Hannah Deyst on 10/23/25.
//
import SwiftUI

class StringInfo: ObservableObject {
    var characters: String
    @Published var curIndex: Int
    @Published var curColor: Color
    @Published var curChar: Character = " "
    
    init(characters: String, curColor: Color) {
        self.characters = characters
        self.curIndex = 0
        self.curColor = curColor
        self.curChar = characters[curIndex]
    }
    
    func increment() {
        if !(curIndex >= characters.count-1) {
            curIndex += 1
            curColor = .black
            curChar = characters[curIndex]
        } else {
            curColor = .red
        }
    }
    
    func decrement() {
        if !(curIndex <= 0) {
            curIndex -= 1
            curColor = .black
            curChar = characters[curIndex]
        } else {
            curColor = .red
        }
    }
    
    func changeString(str: String) {
        print("og string " + characters)
        characters = str
        print("new string assigned to characters: " + characters)
        
        print("cur index b4 \(curIndex)")

        // make sure index isnt out of range
        if curIndex >= str.count {
            curIndex = str.count-1
            curColor = .red
        }
        // if color was red and now the index is less than char count, turn black
        else if curIndex < str.count && curColor == .red {
            curColor = .black
        }

        curChar = str[curIndex]
        print(curChar)
    }
    
}
