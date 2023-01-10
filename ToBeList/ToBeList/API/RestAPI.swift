//
//  RestAPI.swift
//  ToBeList
//
//  Created by Jinhee on 2023/01/09.
//

import Foundation

struct SignUp: Hashable, Codable {
    let email: String
    let nickname: String
    let password: String
    let checkedPassword: String
}

struct Login: Hashable, Codable {
    let email: String
    let password: String
}

struct Calender: Hashable, Codable {
    let id: Int
    let goal: String
    let checked: Bool
}

struct Habit: Hashable, Codable {
    let id: Int
    let goal: String
}

class RestAPI: ObservableObject {
    @Published var login: [Login] = []
    @Published var calender: [Calender] = []
    @Published var habits: [Habit] = []
    
    //MARK: 캘린더에서 목표 조회
    
    
    //MARK: 모달창에서 목표 체크 표시 저장
    
    
    //MARK: 해당 날짜 목표 리스트 조회
    
    
    //MARK: 해당 날짜 체크된 목표 저장
    
    
    //MARK: 목표 조회
    func get() {
            guard let url = URL(string:
                "api 주소") else {
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                do {
                    let habits = try JSONDecoder().decode([Habit].self, from: data)
                    DispatchQueue.main.async {
                        self?.habits = habits
                    }
                }
                catch {
                    print(error)
                }
            }
            task.resume()
        }
    
    //MARK: 목표 작성
    func create(parameters: [String: Any]) {
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
