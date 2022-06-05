//
//  AddView.swift
//  HabitTracking
//
//  Created by Shokri Alnajjar on 5.06.2022.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var activities : Activities
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                TextField("Description", text: $description)
            }
            .navigationTitle("Add Habit")
            .toolbar {
                ToolbarItemGroup {
                    Button("Save") {
                        let items = ActivityItem(name: name, description: description)
                        activities.items.append(items)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}
