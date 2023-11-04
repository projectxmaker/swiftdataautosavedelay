//
//  BikeListView.swift
//  FamilyBook
//
//  Created by Pham Anh Tuan on 11/4/23.
//

import SwiftUI
import SwiftData

struct BikeListView: View {
    @Environment(\.modelContext) var modelContext
    @Query var bikes: [Bike]
    
    var body: some View {
        VStack {
            HStack(spacing: 30) {
                Button {
                    addSamples()
                } label: {
                    Text("Add")
                }
                
                Button {
                    deleteSamples()
                } label: {
                    Text("Delete")
                }
            }
            
            List {
                ForEach(bikes) { eachBike in
                    Text(eachBike.name)
                }
            }
        }
    }
    
    func addSamples() {
        let bikeOne = Bike(name: "One")
        let bikeTwo = Bike(name: "Two")
        
        modelContext.insert(bikeOne)
        modelContext.insert(bikeTwo)
    }
    
    func deleteSamples() {
        try? modelContext.delete(model: Bike.self)
    }
}

#Preview {
    do {
        let modelConfig = ModelConfiguration(isStoredInMemoryOnly: false)
        let modelContainer = try ModelContainer(for: Bike.self, configurations: modelConfig)
        return BikeListView()            .modelContainer(modelContainer)
    } catch {
        fatalError("Content View's Preview")
    }
}
