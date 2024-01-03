//
//  Item.swift
//  Landmarks
//
//  Created by Doris Lam on 2024-01-03.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
