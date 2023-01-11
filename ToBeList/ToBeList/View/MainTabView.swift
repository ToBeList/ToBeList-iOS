//
//  MainTabView.swift
//  ToBeList
//
//  Created by Jinhee on 2023/01/11.
//

import SwiftUI

struct MainTabView: View {
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

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
