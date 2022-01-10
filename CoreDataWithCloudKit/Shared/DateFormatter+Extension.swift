//
//  DateFormatter+Extension.swift
//  CoreDataWithCloudKit
//
//  Created by Igor Ferreira on 4/1/22.
//

import Foundation

extension DateFormatter {
    static var shortFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    static var fullFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .full
        return formatter
    }()
}
