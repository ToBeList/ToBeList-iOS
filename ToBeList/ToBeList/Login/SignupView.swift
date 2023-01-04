//
//  SignupView.swift
//  ToBeList
//
//  Created by Jinhee on 2023/01/02.
//

import SwiftUI

struct SignupView: View {
    @Environment(\.presentationMode) var presention
    @State private var id: String = ""
    @State private var password: String = ""
    @State private var password2: String = ""
    
    var body: some View {
        VStack {
            Image("rabbit")
                .resizable()
                .frame(width: 70, height: 70)
            Divider()
                .background(Color(r:130, g: 170, b: 227))
                .frame(width: 300)
                .padding()
            HStack {
                Spacer()
                TextField("아이디", text: $id)
                //.textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                Spacer()
            }
            .padding(10)
            HStack {
                Spacer()
                SecureField("비밀번호", text: $password)
                //.textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                Spacer()
            }
            .padding(10)
            HStack {
                Spacer()
                SecureField("비밀번호 확인", text: $password2)
                //.textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                Spacer()
            }
            .padding(10)
            HStack {
                Button(action: {
                    presention.wrappedValue.dismiss()
                }) {
                    Text("뒤로가기")
                        .bold()
                }
                .frame(width: 100, height: 35)
                .background(RoundedRectangle(cornerRadius: 40).fill(Color(r:130, g: 170, b: 227)))
                .font(.system(size: 20))
                .foregroundColor(Color.white)
                Button(action: {
                    presention.wrappedValue.dismiss()
                }) {
                    Text("가입하기")
                        .bold()
                }
                .frame(width: 100, height: 35)
                .background(RoundedRectangle(cornerRadius: 40).fill(Color(r:130, g: 170, b: 227)))
                .font(.system(size: 20))
                .foregroundColor(Color.white)
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
