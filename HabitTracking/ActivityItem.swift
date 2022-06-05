//
//  ActivityItem.swift
//  HabitTracking
//
//  Created by Shokri Alnajjar on 5.06.2022.
//

import Foundation

struct ActivityItem : Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
}
