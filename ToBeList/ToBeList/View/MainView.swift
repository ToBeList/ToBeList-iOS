//
//  MainView.swift
//  ToBeList
//
//  Created by Jinhee on 2023/01/01.
//

import SwiftUI

struct MainView: View {
    @State private var data = Date()
    
    var body: some View {
        VStack{
            HStack {
                Image("rabbit")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("jh 님")
                Spacer()
            }
            .padding()
            DatePicker("d", selection: $data)
                .datePickerStyle(.graphical)
                .frame(maxHeight: 400)
            Spacer()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
