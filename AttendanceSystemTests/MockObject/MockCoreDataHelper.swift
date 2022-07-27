//
//  MockCoreDataHelper.swift
//  AttendanceSystemTests
//
//  Created by Paradox Space Rumy M1 on 27/7/22.
//

import Foundation
import CoreData
@testable import AttendanceSystem


class MockCoreDataHelper: CoreDataHelper {
    override init() {
        super.init()
//        let persistentStoreDescription = NSPersistentStoreDescription()
//        persistentStoreDescription.type = NSInMemoryStoreType
        
        let containers = NSPersistentCloudKitContainer(name: CoreDataHelper.containerName)
        
//        guard let description = containers.persistentStoreDescriptions.first else{
//            fatalError("No description found")
//        }
//        description.setOption(true as NSObject, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
//        description.cloudKitContainerOptions = NSPersistentCloudKitContainerOptions(containerIdentifier: containerIdentifier)
        
        //containers.persistentStoreDescriptions = [persistentStoreDescription]
        
        let persistentStoreDescription = NSPersistentStoreDescription()
        persistentStoreDescription.setOption(true as NSObject, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
        persistentStoreDescription.cloudKitContainerOptions = NSPersistentCloudKitContainerOptions(containerIdentifier: containerIdentifier)
        containers.persistentStoreDescriptions = [persistentStoreDescription]
        
        containers.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        container = containers
    }
}


