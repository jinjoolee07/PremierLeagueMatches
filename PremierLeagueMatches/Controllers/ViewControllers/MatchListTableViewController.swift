//
//  MatchListTableViewController.swift
//  PremierLeagueMatches
//
//  Created by Jin Joo Lee on 5/6/21.
//

import UIKit

class MatchListTableViewController: UITableViewController {
    
    let matchManager = MatchManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        matchManager.fetchMatch()
        matchManager.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.barStyle = .
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchManager.matches.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "matchCell", for: indexPath) as? MatchTableViewCell else { return UITableViewCell()}
        let match = matchManager.matches[indexPath.row]
        cell.match = match

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension MatchListTableViewController: MatchManagerDelegate {
    func didUpdateMatchManager(list: [Match]) {
        tableView.reloadData()
    }
}
