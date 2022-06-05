//
//  Activities.swift
//  HabitTracking
//
//  Created by Shokri Alnajjar on 5.06.2022.
//

import Foundation

class Activities : ObservableObject {
    @Published var items = [ActivityItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "items") {
            if let decodedItems = try? JSONDecoder().decode([ActivityItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
