//
//  ContentView.swift
//  Shared
//
//  Created by Igor Ferreira on 4/1/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @EnvironmentObject private var viewModel: ContentViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach($viewModel.items, id: \.self) { $item in
                    NavigationLink {
                        DetailView(viewModel: viewModel, item: item)
                    } label: {
                        ContentCell(item: item, formatter: viewModel.itemFormatter)
                    }
                    .contextMenu {
                        FavouriteButton(item: item, viewModel: viewModel)
                        DeleteItemButton(item: item, viewModel: viewModel)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        FavouriteButton(item: item, viewModel: viewModel)
                        .tint(.blue)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        DeleteItemButton(item: item, viewModel: viewModel)
                        .tint(.red)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    AddItemButton(action: addItem)
                }
#if os(iOS)
                ToolbarItem(placement: .destructiveAction) {
                    EditButton()
                }
#endif
            }
            .navigationTitle("Items")
            DetailView(viewModel: viewModel, item: nil)
        }
    }
    
    func deleteItem(item: Item) {
        //In case of errors, a proper alert should be shown
        try? viewModel.deleteItem(item: item)
    }
    
    func deleteItems(offsets: IndexSet) {
        //In case of errors, a proper alert should be shown
        try? viewModel.deleteItems(offsets: offsets)
    }
    
    func addItem() {
        //In case of errors, a proper alert should be shown
        try? viewModel.addItem()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var persistentController = PersistenceController.loadTestData(into: PersistenceController(inMemory: true))
    
    static var previews: some View {
        Group {
            ContentView()
                .environmentObject(ContentViewModel(viewContext: persistentController.viewContext))
        }
    }
}
#endif
