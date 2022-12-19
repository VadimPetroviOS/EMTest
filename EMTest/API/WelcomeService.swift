//
//  WelcomeService.swift
//  EMTest
//
//  Created by Вадим on 19.12.2022.
//

import Foundation

class WelcomeService {
    func parse(comp : @escaping (WelcomeEntity) -> ()) {
        let api = URL(string: "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175")
        
        URLSession.shared.dataTask(with: api!) { data, responce, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            do {
                let result = try JSONDecoder().decode(WelcomeEntity.self, from: data!)
                comp(result)
                
            } catch {
                print(error)
            }
        }.resume()
    }
}
