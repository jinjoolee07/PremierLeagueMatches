//
//  Match.swift
//  PremierLeagueMatches
//
//  Created by Jin Joo Lee on 5/5/21.
//

import Foundation

struct Matches: Codable {
    var matchList: [Match]
    
    enum CodingKeys: String, CodingKey {
        case matchList = "matches"
    }
}

struct Match: Codable {
    let utcDate: String
    let score: Score
    let homeTeam: HomeTeam
    let awayTeam: AwayTeam
}

struct Score: Codable {
    let fullTime: FullTime
}

struct FullTime: Codable {
    let homeTeamScore: Int?
    let awayTeamScore: Int?
    
    enum CodingKeys: String, CodingKey {
        case homeTeamScore = "homeTeam"
        case awayTeamScore = "awayTeam"
    }
}

struct HomeTeam: Codable {
    let name: String
}

struct AwayTeam: Codable {
    let name: String
}
