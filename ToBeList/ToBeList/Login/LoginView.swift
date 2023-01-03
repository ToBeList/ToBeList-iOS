//
//  LoginView.swift
//  ToBeList
//
//  Created by Jinhee on 2023/01/01.
//

import SwiftUI

extension Color {
    init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255)
    }
}

struct LoginView: View {
    @State private var id: String = ""
    @State private var password: String = ""
    @State private var signup = false
    @State var tag:Int? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image("rabbit")
                    .resizable() // 크기 조절
                    .frame(width: 70, height: 70)
                Text("TToBe")
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
                    NavigationLink(destination: ContentView(), tag: 1, selection: self.$tag){}
                    Button(action: {
                        self.tag = 1
                    }) {
                        Text("로그인")
                            .frame(width: 100, height: 35)
                            .fontWeight(.semibold)
                            .font(.title3)
                            .foregroundColor(.white)
                            .background(RoundedRectangle(cornerRadius: 40).fill(Color(r:191, g: 234, b: 245)))
                    }
                
                    Button(action: {
                        self.signup = true
                    }) {
                        Text("회원가입")
                            .frame(width: 100, height: 35)
                            .fontWeight(.semibold)
                            .font(.title3)
                            .foregroundColor(.white)
                            .background(RoundedRectangle(cornerRadius: 40).fill(Color(r:130, g: 170, b: 227)))
                            .sheet(isPresented: self.$signup) {
                                SignupView()
                            }
                    }
                }
                .padding()
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
