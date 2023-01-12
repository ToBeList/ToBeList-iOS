//
//  RestAPI.swift
//  ToBeList
//
//  Created by Jinhee on 2023/01/09.
//

import Foundation
import Combine

struct SignUp: Hashable, Codable {
    let email: String
    let nickname: String
    let password: String
    let checkedPassword: String
}

struct Login: Hashable, Codable {
//    let email: String
//    let password: String
    let grantType: String
    let accessToken: String
    let refreshToken: String
}

struct Calender: Hashable, Codable {
    let id: Int
    let goal: String
    let checked: Bool
}

struct Habit: Hashable, Codable {
    let id: Int
    let checked: Int
    let goal: String
    let daily_id: Int
    let user_id: Int
}

class RestAPI: ObservableObject {
    static let shared = RestAPI()
    @Published var signup: [SignUp] = []
    @Published var login: [Login] = []
    @Published var calender: [Calender] = []
    @Published var goals: [Habit] = []
    
//    var didChange = PassthroughSubject<RestAPI, Never>()
//    @Published var loginsuccess: Bool = false {
//        didSet {
//            didChange.send(self)
//        }
//    }
    @Published var loginsuccess: Bool = false
    
    //MARK: 회원가입
    func Signup(parameters: [String: Any]) {
        guard let url = URL(string:
                                "http://ttubelist.duckdns.org/signup") else {
            return
        }
        
        // 원하는 객체 타입으로 바꿔주기 위해 JSONSerialization 사용
        // 파라미터는 api 호출시 받는거
        // 파라미터로 받은 객체를 원하는 타입으로 바꿔서 data에 저장
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        // URLRequest 객체 정의하고 요청 내용 담기
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // URLSession은 http를 통해 데이터를 주고 받는 api 제공 클래스
        // 비동기(요청과 응답이 동시에 일어나지 않음) 처리하기 위한 코드
        // URLSession 객체를 통해 전송 및 응답값 처리
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                // JSON 타입의 데이터를 디코딩해서 posts에 저장
                let posts = try JSONDecoder().decode(String.self, from: data)
                DispatchQueue.main.async {
                    print(posts)
                }
            }
            catch {
                print(error)
            }
        }
        // post 전송
        task.resume()
    }

    //MARK: 로그인
//    func LoginSuccess(parameters: [String: Any]) {
    func LoginSuccess(parameters: [String: Any],completion: @escaping (Bool) -> Void) {

        guard let url = URL(string:
                                "http://ttubelist.duckdns.org/login") else {
            return
        }

        
        let data = try! JSONSerialization.data(withJSONObject: parameters)

        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
                
            }

            do {
                let posts = try JSONDecoder().decode(Login.self, from: data)
                DispatchQueue.main.async {
//                    self!.loginsuccess = true
//                    print("여기: ", self!.loginsuccess)
//                    print("여기: ", posts)
                    completion(true)
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
//    func callback() {
//        if loginsuccess == true {
//
//        }
//    }
    
    //MARK: 캘린더에서 목표 조회
    
    
    //MARK: 모달창에서 목표 체크 표시 저장
    
    
    //MARK: 해당 날짜 목표 리스트 조회
    
    
    //MARK: 해당 날짜 체크된 목표 저장
    
    
    //MARK: 목표 출력
    func GoalGet() {
            guard let url = URL(string:
                "http://ttubelist.duckdns.org/main/habit") else {
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                do {
                    let goals = try JSONDecoder().decode([Habit].self, from: data)
                    DispatchQueue.main.async {
                        self?.goals = goals
                        print("여기 ",goals)
                    }
                }
                catch {
                    print(error)
                }
            }
            task.resume()
        }
    
    //MARK: 목표 저장
    func GoalCreate(parameters: [String: Any]) {
            guard let url = URL(string:
                "api 주소") else {
                return
            }

            let data = try! JSONSerialization.data(withJSONObject: parameters)

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = data
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")


            let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    return
                }

                do {
                    let habits = try JSONDecoder().decode([Habit].self, from: data)
                    DispatchQueue.main.async {
                        print(habits)
                    }
                }
                catch {
                    print(error)
                }
            }
            task.resume()
        }
    
    //MARK: - 목표 삭제
        func commentdelete(parameters: [String: Int]) {
            let habitId = parameters["habitId"]!

            guard let url = URL(string:
                "api 주소") else {
                print("error")
                return
            }

            let data = try! JSONSerialization.data(withJSONObject: parameters)

            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            request.httpBody = data
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")


            let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    return
                }

                do {
                    let habit = try JSONDecoder().decode([Habit].self, from: data)
                    DispatchQueue.main.async {
                        print(habit)
                    }
                }
                catch {
                    print(error)
                }
            }
            task.resume()
        }
}
