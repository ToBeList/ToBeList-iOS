//
//  ContentView.swift
//  ToBeList
//
//  Created by Jinhee on 2022/12/31.
//

import SwiftUI

struct ContentView: View {
    @State var loginSuccess = false
    
    var body: some View {
        
        return Group {
            if loginSuccess {
                MainTabView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
            }
            else {
                LoginView(loginSuccess: $loginSuccess)
            }
        }
        
//        TabView{
//            MainView()
//                .tabItem {
//                    Image(systemName: "house")
//                }
//            WriteView()
//                .tabItem {
//                    Image(systemName: "square.and.pencil")
//                }
//        }
//        .accentColor(Color(r:130, g: 170, b: 227))
//        .navigationBarBackButtonHidden(true)
//        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
