//
//  BreakUps.swift
//  BreakUpTracker
//
//  Created by iiqrah on 23/02/2022.
//

import Foundation

class BreakUps: ObservableObject {
    
    @Published var items = [BreakUp](){
        didSet {
                if let encoded = try? JSONEncoder().encode(items) {
                    UserDefaults.standard.set(encoded, forKey: "Items")
                }
            }
  
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([BreakUp].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
}
