//
//  DeleteItemMenuItem.swift
//  CoreDataWithCloudKit
//
//  Created by Igor Ferreira on 4/1/22.
//

import Foundation
import SwiftUI

struct DeleteItemButton: View {
    
    @State var item: Item
    @State var viewModel: ContentViewModel
    
    var body: some View {
        Button(action: performAction) {
            Text("Delete")
        }
    }
    
    func performAction() {
        try? viewModel.deleteItem(item: item)
    }
}
