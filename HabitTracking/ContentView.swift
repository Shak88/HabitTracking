//
//  ContentView.swift
//  HabitTracking
//
//  Created by Shokri Alnajjar on 5.06.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    
    @State private var showingSheet = false
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items) { item in
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.description)
                    }
                    
                }
                .onDelete(perform: removeItems)
                
            }
            .navigationTitle("HabitTracker")
            .toolbar {
                ToolbarItemGroup {
                    Button {
                        showingSheet = true
                    } label : {
                        Image(systemName: "plus")
                    }
                }
                
            }
        }
        .sheet(isPresented: $showingSheet){
            AddView(activities: activities)
        }
    }
    func removeItems(at offsets: IndexSet) {
            activities.items.remove(atOffsets: offsets)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
