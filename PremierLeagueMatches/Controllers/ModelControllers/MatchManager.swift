//
//  MatchManager.swift
//  PremierLeagueMatches
//
//  Created by Jin Joo Lee on 5/5/21.
//

import Foundation

protocol MatchManagerDelegate: class {
    func didUpdateMatchManager(list: [Match])
}

class MatchManager {
    
    weak var delegate: MatchManagerDelegate?
    
    let token = "f3797c0c8ba3444b8c360b6ee68a65d3"
    let matchURL = "https://api.football-data.org/v2/competitions/2021/matches"
    
    var matches: [Match] = []
    
    func fetchMatch() {
        
        guard let url = URL(string: matchURL) else { return }
        var request = URLRequest(url: url)
        request.addValue("\(token)", forHTTPHeaderField: "X-Auth-Token")
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let matches = try JSONDecoder().decode(Matches.self, from: data)
                self.matches = matches.matchList
                DispatchQueue.main.async {
                    self.delegate?.didUpdateMatchManager(list: self.matches)
                }
            } catch {
                print(error)
            }
        }
        dataTask.resume()
    }
}
