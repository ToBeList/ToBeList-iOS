//
//  HabitListView.swift
//  ToBeList
//
//  Created by Jinhee on 2023/01/07.
//

import SwiftUI

struct HabitItem: Identifiable {
    var id = UUID()
    var title: String
    var checked: Bool
}

struct HabitListView: View {
    @State var habits = [
        HabitItem(title: "책 읽기", checked: false),
        HabitItem(title: "운동하기", checked: false),
        HabitItem(title: "공부하기", checked: false)
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("2023년도 목표")
                    .font(.title3)
                Spacer()
            }.padding()
            List($habits) { $habit in
                HStack {
                    Image(systemName: habit.checked ? "checkmark.circle.fill" : "circle")
                        .font(.system(size: 22))
                        .foregroundColor(Color(r:191, g: 234, b: 245))
                        .onTapGesture {
                            habit.checked.toggle()
                        }
                    Text(habit.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black.opacity(0.7))
                }
            }.listStyle(PlainListStyle())
        }
    }
}

struct HabitListView_Previews: PreviewProvider {
    static var previews: some View {
        HabitListView()
    }
}
