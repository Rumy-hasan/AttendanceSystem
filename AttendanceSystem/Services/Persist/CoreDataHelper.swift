//
//  CoreDataHelper.swift
//  AttendanceSystem
//
//  Created by Paradox Space Rumy M1 on 26/7/22.
//

import Foundation
import CoreData
import ClockKit


protocol CoreDataHelperProtocol{
    func modifyStaffActivityRecord(isInRegion: Bool)-> StaffActivity?
    func fetchStaffActivity(ofDate: Date) -> StaffActivity?
}

open class CoreDataHelper{
    static let sharedInstance:CoreDataHelper = CoreDataHelper()
    public static let containerName = "StaffActivityMonitor"
    public let containerIdentifier = "iCloud.com.new.AttendenceSystem"
    let modelName = "StaffActivity"

    public lazy var container: NSPersistentContainer = {
        let containers = NSPersistentCloudKitContainer(name: CoreDataHelper.containerName)
        
        guard let description = containers.persistentStoreDescriptions.first else{
            fatalError("No description found")
        }
        description.setOption(true as NSObject, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
        description.cloudKitContainerOptions = NSPersistentCloudKitContainerOptions(containerIdentifier: containerIdentifier)
        
        containers.loadPersistentStores { description, error in
            if error != nil{
                print("error")
            }
        }
        containers.viewContext.automaticallyMergesChangesFromParent = true
        containers.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return containers
    }()
    
    public func create(ofDate: Date) -> StaffActivity{
        let newStaffActivityEntity = StaffActivity(context: self.container.viewContext)
        newStaffActivityEntity.date = ofDate.dateString()
        newStaffActivityEntity.checkin = ofDate
        self.save()
        return newStaffActivityEntity
    }
    
    private func save() {
        do{
           try? self.container.viewContext.save()
        }
    }
}


//MARK:-
extension CoreDataHelper: CoreDataHelperProtocol{
    public func modifyStaffActivityRecord(isInRegion: Bool)-> StaffActivity?{
        if let staffActivity = fetchStaffActivity(ofDate: Date()) {
            if let checkOut = staffActivity.checkout,isInRegion,
               checkOut.isEarlier(ofDate: Date()){
                staffActivity.outsideSpendingTime +=  abs(Int16(checkOut.diffInMinutes(of: Date())))
                staffActivity.checkout = nil
            }else{
                if !isInRegion && staffActivity.checkout == nil{
                    staffActivity.checkout = Date()
                }
            }
            self.save()
            return staffActivity
        }else{
            if isInRegion {
               return create(ofDate: Date())
            }
        }
        return nil
    }
    
    public func fetchStaffActivity(ofDate: Date) -> StaffActivity? {
        let predicate = NSPredicate(format: "date == %@", ofDate.dateString())
        let req = NSFetchRequest<StaffActivity>(entityName: modelName)
        req.predicate = predicate
        do{
            return try? self.container.viewContext.fetch(req).first
        }
    }
}
