//
//  FavouriteButton.swift
//  CoreDataWithCloudKit
//
//  Created by Igor Ferreira on 4/1/22.
//

import Foundation
import SwiftUI

struct FavouriteButton: View {
    
    @State var item: Item
    @State var viewModel: ContentViewModel
    
    var body: some View {
        Button {
            print("Favourite: \(item)")
        } label: {
            Text("Favourite")
        }
    }
}
