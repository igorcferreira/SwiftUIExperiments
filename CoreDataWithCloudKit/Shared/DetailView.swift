//
//  DetailView.swift
//  CoreDataWithCloudKit
//
//  Created by Igor Ferreira on 4/1/22.
//

import Foundation
import SwiftUI

struct DetailView: View {
    
    @State var viewModel: ContentViewModel
    @State var item: Item?
    
    var body: some View {
        if let item = item, let timestamp = item.timestamp {
            Text("Item at \(timestamp, formatter: viewModel.itemFormatter)")
                .toolbar {
                    ToolbarItem(placement: .destructiveAction) {
                        Button {
                            do {
                                try viewModel.deleteItem(item: item)
                                self.item = nil
                            } catch {}
                        } label: {
                            Text("Delete")
                        }.keyboardShortcut(.delete, modifiers: [])
                    }
                    ToolbarItem(placement: .automatic) {
                        FavouriteButton(item: item, viewModel: viewModel)
                            .keyboardShortcut("f")
                    }
                }
                .navigationTitle("\(timestamp, formatter: viewModel.itemFormatter)")
        } else {
            Text("")
        }
    }
}
