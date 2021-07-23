//
//  ContentView.swift
//  Meeting App UI
//
//  Created by Michele Manniello on 22/07/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if #available(iOS 15.0, *) {
            Home()
        } else {
            // Fallback on earlier versions
            Text("")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
