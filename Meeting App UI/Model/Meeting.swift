//
//  Meeting.swift
//  Meeting App UI
//
//  Created by Michele Manniello on 22/07/21.
//

import SwiftUI
//model
struct Meeting: Identifiable {
    var id = UUID().uuidString
    var title : String
    var timing : Date
    var cardColor : Color = Color("Blue")
    var turnedOn : Bool = true
//    Type
    var memberType : String = "Public"
//    Members...
//    Im simpl creating a empty array for member count...
    var members : [String] = Array(repeating: "", count: 10)
}
