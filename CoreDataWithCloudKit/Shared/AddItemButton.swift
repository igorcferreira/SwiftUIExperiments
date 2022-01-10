//
//  AddItemButton.swift
//  CoreDataWithCloudKit
//
//  Created by Igor Ferreira on 4/1/22.
//

import Foundation
import SwiftUI

struct AddItemButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Label("Add Item", systemImage: "plus")
        }.keyboardShortcut("n")
    }
}
