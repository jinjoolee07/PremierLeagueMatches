//
//  DateFormatter+Ext.swift
//  PremierLeagueMatches
//
//  Created by Jin Joo Lee on 5/7/21.
//

import Foundation

extension Date {
    func formattedDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        return dateFormatter.string(from: self)
    }
}
