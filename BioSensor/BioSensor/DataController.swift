//
//  DataController.swift
//  BioSensor
//
//  Created by Rivera Torres, Patria I. on 2/15/23.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "BioSensor")
    
    init() {
        container.loadPersistentStores { descriptoin, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
