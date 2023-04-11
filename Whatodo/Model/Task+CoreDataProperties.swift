//
//  Task+CoreDataProperties.swift
//  Whatodo
//
//  Created by Надежда Левицкая on 4/11/23.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var title: String?
    @NSManaged public var user: User?

}

extension Task : Identifiable {

}
