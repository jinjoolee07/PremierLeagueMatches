//
//  MatchTableViewCell.swift
//  PremierLeagueMatches
//
//  Created by Jin Joo Lee on 5/6/21.
//

import UIKit

class MatchTableViewCell: UITableViewCell {

    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!
    @IBOutlet weak var awayTeamScoreLabel: UILabel!
    @IBOutlet weak var matchDateLabel: UILabel!
    
    var match: Match? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let match = match else { return }
        
        homeTeamNameLabel.text = match.homeTeam.name
        awayTeamNameLabel.text = match.awayTeam.name
        homeTeamScoreLabel.text = "\(match.score.fullTime.homeTeamScore ?? 0)"
        awayTeamScoreLabel.text = "\(match.score.fullTime.awayTeamScore ?? 0)"
        matchDateLabel.text = match.utcDate
    }

}
