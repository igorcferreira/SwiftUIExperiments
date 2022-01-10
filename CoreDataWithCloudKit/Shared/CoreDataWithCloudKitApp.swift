//
//  CoreDataWithCloudKitApp.swift
//  Shared
//
//  Created by Igor Ferreira on 4/1/22.
//

import SwiftUI

@main
struct CoreDataWithCloudKitApp: App {
    let persistenceController = PersistenceController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ContentViewModel(viewContext: persistenceController.viewContext))
        }
    }
}
