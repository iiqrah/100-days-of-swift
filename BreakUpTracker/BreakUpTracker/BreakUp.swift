//
//  BreakUp.swift
//  BreakUpTracker
//
//  Created by iiqrah on 23/02/2022.
//

import Foundation

struct BreakUp: Identifiable, Codable, Equatable {
    var id = UUID()
    var name : String
    var date: String
    var description: String
    var count : Int
}
