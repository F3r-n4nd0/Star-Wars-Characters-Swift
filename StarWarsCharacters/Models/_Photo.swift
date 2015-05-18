// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Photo.swift instead.

import CoreData

enum PhotoAttributes: String {
    case image = "image"
}

enum PhotoRelationships: String {
    case character = "character"
}

@objc
class _Photo: NSManagedObject {

    // MARK: - Class methods

    class func entityName () -> String {
        return "Photo"
    }

    class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Photo.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged
    var image: NSData?

    // func validateImage(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    // MARK: - Relationships

    @NSManaged
    var character: Character?

    // func validateCharacter(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

}

