// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Sound.swift instead.

import CoreData

enum SoundAttributes: String {
    case sound = "sound"
}

enum SoundRelationships: String {
    case character = "character"
}

@objc
class _Sound: NSManagedObject {

    // MARK: - Class methods

    class func entityName () -> String {
        return "Sound"
    }

    class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Sound.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged
    var sound: NSData?

    // func validateSound(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    // MARK: - Relationships

    @NSManaged
    var character: Character?

    // func validateCharacter(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

}

