//
//  ContentViewModel.swift
//  CoreDataWithCloudKit
//
//  Created by Igor Ferreira on 4/1/22.
//

import Foundation
import CoreData
import SwiftUI

class ContentViewModel: NSObject, ObservableObject {
    @Published var itemFormatter: DateFormatter
    @Published var items: [Item] = []
    
    private let viewContext: NSManagedObjectContext
    private let fetchController: NSFetchedResultsController<Item>
    
    convenience init(
        viewContext: NSManagedObjectContext,
        itemFormatter: DateFormatter = DateFormatter.shortFormatter
    ) {
        self.init(viewContext: viewContext, itemFormatter: itemFormatter, sortPath: \Item.timestamp, ascending: true)
    }
    
    init<Value>(
        viewContext: NSManagedObjectContext,
        itemFormatter: DateFormatter,
        sortPath: KeyPath<Item, Value>,
        ascending: Bool = true
    ) {
        
        let request = Item.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: sortPath, ascending: ascending)]
        
        self.itemFormatter = itemFormatter
        self.viewContext = viewContext
        self.fetchController = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: viewContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        
        super.init()
        
        fetchController.delegate = self
        do {
            try fetchController.performFetch()
            items = fetchController.fetchedObjects ?? []
        } catch {
            items = []
        }
    }
    
    func addItem() throws {
        try withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            try viewContext.save()
        }
    }

    func deleteItem(item: Item) throws {
        try withAnimation {
            viewContext.delete(item)
            try viewContext.save()
        }
    }
    
    func deleteItems(offsets: IndexSet) throws {
        try withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            try viewContext.save()
        }
    }
}

extension ContentViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let objects = controller.fetchedObjects as? [Item] else { return }
        items = objects
    }
}
