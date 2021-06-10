//
//  CoreDataStack.swift
//  UpDrink
//
//  Created by J.R. Madey on 6/10/21.
//

import Foundation
import CoreData


// Classes intialize Data Model
public class PersistentContainer: NSPersistentContainer {}

public class CoreDataStack {
    
    public let persistentContainer: NSPersistentContainer
    
    public init() {
        persistentContainer = PersistentContainer(name: "WaterTrackingModel")
        
        persistentContainer.loadPersistentStores(completionHandler: {
            description, error in
            if let error = error {
                fatalError("Core Data Store failed to properly load. Error: \(error)")
            }
        })
    }
}

//Extensions provide essential functions for later use throughout app re: Core Data
public extension CoreDataStack {
    func saveWaterHistory(named ounces: String) {
        let waterHistroy = WaterHistory(context: persistentContainer.viewContext)
        waterHistroy.ounces = ounces
        
        do {
            try persistentContainer.viewContext.save()
            print("Ounces successfully saved!")
        } catch {
            persistentContainer.viewContext.rollback()
            print("Did not save ounces. Error: \(error)")
        }
    }
}

public extension CoreDataStack {
    func getAllOunces() -> [WaterHistory] {
        let fetchRequest: NSFetchRequest<WaterHistory> = WaterHistory.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print("Failed to fetch ounces. Error: \(error)")
            return []
        }
    }
}

public extension CoreDataStack {
    func deleteOunces(_ ounces: WaterHistory) {
        persistentContainer.viewContext.delete(ounces)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save. Error: \(error)")
        }
    }
    
    func updateOunces(_ ounces: WaterHistory) {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save. Error: \(error).")
        }
    }
}

