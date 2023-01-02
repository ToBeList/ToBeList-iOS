//
//  ContentView.swift
//  ToBeList
//
//  Created by Jinhee on 2022/12/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            MainView()
                .tabItem {
                    Image(systemName: "house")
                }
            WriteView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                }
        }
        .accentColor(Color(r:130, g: 170, b: 227))
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
