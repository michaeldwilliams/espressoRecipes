//
//  BagStore.swift
//  espressoRecipes
//
//  Created by Michael Williams on 9/14/17.
//  Copyright © 2017 Michael D. Williams. All rights reserved.
//

import Foundation

class BagStore: Codable {
    var allBags = [Bag]()
    let bagArchiveURL: URL = {
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        var documentDirectory = documentDirectories.first!
        return documentDirectory.appendingPathComponent("bags.archive")
    }()
    
    init() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: bagArchiveURL)
            let loadedBags = try decoder.decode([Bag].self, from: data)
            allBags += loadedBags
        } catch {
            print("Could not load bags from archive.")
        }
    }
    
    func saveChanges() -> Bool {
        print("Saving items to \(bagArchiveURL.path)")
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(allBags)
            try data.write(to: bagArchiveURL)
            return true
        } catch {
            return false
        }
    }
    
    
}
