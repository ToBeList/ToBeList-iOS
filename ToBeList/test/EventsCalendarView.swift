//
//  EventsCalendarView.swift
//  ToBeList
//
//  Created by Jinhee on 2023/01/06.
//

import SwiftUI

struct EventsCalendarView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                CalenderView(interval: DateInterval(start: .distantPast, end: .distantFuture))
            }
        }
    }
}

struct EventsCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        EventsCalendarView()
    }
}
