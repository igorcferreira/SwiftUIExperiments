//
//  Persistence+SwiftUI.swift
//  CoreDataWithCloudKit
//
//  Created by Igor Ferreira on 4/1/22.
//

import Foundation

import SwiftUI

private struct PersistenceControllerKey: EnvironmentKey {
    static let defaultValue: PersistenceController = PersistenceController(inMemory: true)
}

extension EnvironmentValues {
    var persistenceController: PersistenceController {
        get { self[PersistenceControllerKey.self] }
        set { self[PersistenceControllerKey.self] = newValue }
    }
}
