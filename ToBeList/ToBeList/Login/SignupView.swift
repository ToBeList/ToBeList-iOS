//
//  SignupView.swift
//  ToBeList
//
//  Created by Jinhee on 2023/01/02.
//

import SwiftUI

struct SignupView: View {
    @Environment(\.presentationMode) var presention
    @State private var email: String = ""
    @State private var nickname: String = ""
    @State private var password: String = ""
    @State private var checkedPassword: String = ""
    @StateObject var api = RestAPI()
    
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
                TextField("이메일", text: $email)
                //.textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none) // 자동으로 대문자 설정 안하기
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                Spacer()
            }
            .padding(10)
            HStack {
                Spacer()
                TextField("닉네임", text: $nickname)
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
                Spacer()
                SecureField("비밀번호 확인", text: $checkedPassword)
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
                    if email != "" && nickname != "" && password != "" && checkedPassword != "" {
                        let parameters: [String: Any] = ["email": email, "nickname": nickname, "password": password, "checkedPassword": checkedPassword]
                        api.Signup(parameters: parameters)
                        
                        // api 보냈으니까 text 비워주기
                        email = ""
                        nickname = ""
                        password = ""
                        checkedPassword = ""
                        presention.wrappedValue.dismiss()
                    } else {
                        presention.wrappedValue.dismiss()
                    }
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

//struct SignupView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignupView()
//    }
//}
