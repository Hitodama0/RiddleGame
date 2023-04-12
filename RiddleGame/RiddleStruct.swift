//
//  RiddleStruct.swift
//  RiddleGame
//
//  Created by Biagio Ricci on 12/04/23.
//

import Foundation

struct Riddle: Hashable, Codable {
    let riddle: String
    let answer: String
}

class ViewModel: ObservableObject {
    @Published var riddle: Riddle?
    func fetch() {
        guard let url = URL(string: "https://riddles-api.vercel.app/random") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let riddle = try JSONDecoder().decode(Riddle.self, from: data)
                DispatchQueue.main.async {
                    self.riddle = riddle
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
