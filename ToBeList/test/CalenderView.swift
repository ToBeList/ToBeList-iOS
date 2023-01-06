//
//  CalenderView.swift
//  ToBeList
//
//  Created by Jinhee on 2023/01/06.
//

import SwiftUI

struct CalenderView: UIViewRepresentable {
    let interval: DateInterval
    
    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView()
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        return view
    }
    
    func makeCoordinator() -> Coordinator {
        
    }
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
    }
    
//    class Coordinator: NSObject, UICalendarViewDelegate {
//        var parent: CalendarView
//        @ObservedObject var eventStore: EventStore
//        init(parent: CalendarView, eventStore: EventStore) {
//            self.parent = parent
//            self.eventStore = eventStore
//        }
//
//        func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
//            return nil
//        }
//    }
}
