//
//  Date+DateFormatter.swift
//  espressoRecipes
//
//  Created by Michael Williams on 9/13/17.
//  Copyright © 2017 Michael D. Williams. All rights reserved.
//

import Foundation

extension Date {
    private static var dateFormatter:DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        formatter.timeZone = .autoupdatingCurrent
        return formatter
    }()
    
    public var dateString: String {
        return Date.dateFormatter.string(from: self)
    }
}
