//
//  WriteView.swift
//  ToBeList
//
//  Created by Jinhee on 2023/01/01.
//

import SwiftUI

struct WriteView: View {
    @State private var habits = ["책 읽기","운동하기","공부하기"]
    @State var showingAlert = false
    @State var newHabit: String = ""
    @StateObject var api = RestAPI()
    
    var addHabitBar: some View {
        HStack {
            TextField("새로운 목표", text: self.$newHabit)
                .padding(5)
            Button(action: {
                
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(Color(r:130, g: 170, b: 227))
                    .font(.system(size: 25))
            })
        }
    }
    
    var body: some View {
        //NavigationView {
            VStack {
                HStack {
                    Image("rabbit")
                        .resizable()
                        .frame(width:35, height: 35)
                    Text("2023년도 목표")
                        .font(.system(size: 19))
                    //.fontWeight(.semibold)
                }
                Divider()
                    .background(Color(r:130, g: 170, b: 227))
                    .frame(width: 300)
                addHabitBar
                    .padding()
                List {
                    ForEach(habits, id: \.self) { habits in
                        Text(habits)
                    }
//                    ForEach(api.goals, id: \.self) { goal in
//                        Text(goal.goal)
//                    }
                    .onDelete(perform: deleteHabit)
                }.listStyle(PlainListStyle())
                    .onAppear {
                        api.GoalGet()
                    }
                //.navigationBarTitle("2023 목표", displayMode: .inline)
            }
        //}
    }
    
    // 삭제 함수
    func deleteHabit(at offsets: IndexSet) {
        habits.remove(atOffsets: offsets)
    }
}

struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView()
    }
}
