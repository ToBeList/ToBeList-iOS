//
//  MainView.swift
//  ToBeList
//
//  Created by Jinhee on 2023/01/01.
//

import SwiftUI

struct MainView: View {
    @State private var date = Date() // 선택한 날짜
    @State private var habitlist = false
    
    var body: some View {
        ScrollView {
            VStack{
                HStack {
                    Image("rabbit")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("jh 님")
                    Spacer()
                }
                .padding()
                DatePicker("d", selection: $date)
                    .datePickerStyle(.graphical)
                    .frame(maxHeight: 400)
                    .onChange(of: date, perform: { newValue in
                        habitlist.toggle()
                    })
                    .sheet(isPresented: self.$habitlist) {
                        HabitListView()
                                .presentationDetents([.medium, .large])
                   }
                Spacer()
//                Text(date, format: Date.FormatStyle()
//                    .year()
//                    .month(.wide)
//                    .day(.defaultDigits)
//                )
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
