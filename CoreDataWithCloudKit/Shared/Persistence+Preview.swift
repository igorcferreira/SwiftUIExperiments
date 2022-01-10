//
//  Persistence+Preview.swift
//  CoreDataWithCloudKit
//
//  Created by Igor Ferreira on 4/1/22.
//

#if DEBUG
import Foundation

extension PersistenceController {
    static func loadTestData(into controller: PersistenceController) -> PersistenceController {
        let viewContext = controller.viewContext
        for _ in 0..<10 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        return controller
    }
}

#endif
