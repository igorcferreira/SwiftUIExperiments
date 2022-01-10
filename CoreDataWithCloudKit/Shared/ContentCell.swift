//
//  ContentCell.swift
//  CoreDataWithCloudKit
//
//  Created by Igor Ferreira on 4/1/22.
//

import Foundation
import SwiftUI

struct ContentCell: View {
    @State var item: Item
    @State var formatter: DateFormatter
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 4.0) {
            Text("Item:")
            if let timestamp = item.timestamp {
                Text(timestamp, formatter: formatter)
            }
        }
    }
}
