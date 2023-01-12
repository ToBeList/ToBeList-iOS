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
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var signup = false
    @State var tag:Int? = nil
    @StateObject var api = RestAPI.shared
    @State private var error = false
    @Binding var loginSuccess: Bool
    
//    let a =  RestAPI.shared.$loginsuccess.sink { value in
//            print("value? \(value)")
////        self.loginSuccess = true
//
//        }
    
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
                //Spacer()
                HStack {
                    Spacer()
                    TextField("이메일", text: $email)
                        .padding()
                        .autocapitalization(.none) // 자동으로 대문자 설정 안하기
                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                    Spacer()
                }
                .padding(10)
                HStack {
                    Spacer()
                    SecureField("비밀번호", text: $password)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                    Spacer()
                }
                .padding(10)
                HStack {
//                    NavigationLink(destination: ContentView(), tag: 1, selection: self.$tag){}
                    Button(action: {
//                        self.tag = 1

                        // 이메일, 비밀번호 로그인 api 파라미터로 보내주기
                        if email != "" && password != "" {
                            let parameters: [String: Any] = ["email": email, "password": password]
                            //api.LoginSuccess(parameters: parameters)
                            api.LoginSuccess(parameters: parameters) { value in
                               
                                if value {
                                    self.loginSuccess = true
                                }
                                else {
                                    self.error = true
                                }
                            }

                            //print(self.api.$loginsuccess)
//                            self.api.$loginsuccess.sink(receiveCompletion: self._loginSuccess) {
//                                print($0)
//                            }
//                            self.api.$loginsuccess.sink(receiveValue: { value in
//                                                print(value)
//                                            })
                        }
                        else {
                            self.error = true
                        }
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
                if error {
                    Text("이메일 또는 비밀번호 오류")
                        .foregroundColor(Color.red)
                }
            }
        }
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
