//
//  User+CoreDataProperties.swift
//  Whatodo
//
//  Created by Надежда Левицкая on 4/11/23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var profilePic: Data?
    @NSManaged public var task: Task?

}

extension User : Identifiable {

}
