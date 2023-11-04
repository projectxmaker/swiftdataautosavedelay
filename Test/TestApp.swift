//
//  TestApp.swift
//  Test
//
//  Created by Pham Anh Tuan on 11/4/23.
//

import SwiftUI
import SwiftData

@main
struct TestApp: App {
    var body: some Scene {
        WindowGroup {
            BikeListView()
        }
        .modelContainer(for: Bike.self)
    }
}
