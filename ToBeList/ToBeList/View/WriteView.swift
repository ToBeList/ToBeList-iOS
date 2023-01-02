//
//  WriteView.swift
//  ToBeList
//
//  Created by Jinhee on 2023/01/01.
//

import SwiftUI

struct WriteView: View {
    var body: some View {
        VStack {
            Text("2023년도 목표")
            Divider()
                .background(Color(r:130, g: 170, b: 227))
                .frame(width: 300)
        }
    }
}

struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView()
    }
}
