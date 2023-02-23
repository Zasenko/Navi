//
//  CoreDataUser+CoreDataProperties.swift
//  Navigay
//
//  Created by Dmitry Zasenko on 23.02.23.
//
//

import Foundation
import CoreData


extension CoreDataUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataUser> {
        return NSFetchRequest<CoreDataUser>(entityName: "CoreDataUser")
    }

    @NSManaged public var about: String?
    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var pic: Int
}

extension CoreDataUser : Identifiable {

}
