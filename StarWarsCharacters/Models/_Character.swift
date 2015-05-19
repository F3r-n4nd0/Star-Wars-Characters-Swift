// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Character.swift instead.

import CoreData

enum CharacterAttributes: String {
    case birthYear = "birthYear"
    case created = "created"
    case edited = "edited"
    case eyeColor = "eyeColor"
    case gender = "gender"
    case hairColor = "hairColor"
    case height = "height"
    case mass = "mass"
    case name = "name"
    case skinColor = "skinColor"
    case url = "url"
}

enum CharacterRelationships: String {
    case photo = "photo"
    case sound = "sound"
}

@objc
class _Character: NSManagedObject {

    // MARK: - Class methods

    class func entityName () -> String {
        return "Character"
    }

    class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Character.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged
    var birthYear: String?

    // func validateBirthYear(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var created: NSDate?

    // func validateCreated(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var edited: NSDate?

    // func validateEdited(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var eyeColor: String?

    // func validateEyeColor(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var gender: String?

    // func validateGender(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var hairColor: String?

    // func validateHairColor(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var height: NSDecimalNumber?

    // func validateHeight(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var mass: NSDecimalNumber?

    // func validateMass(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var name: String?

    // func validateName(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var skinColor: String?

    // func validateSkinColor(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var url: String

    // func validateUrl(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    // MARK: - Relationships

    @NSManaged
    var photo: Photo?

    // func validatePhoto(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var sound: Sound?

    // func validateSound(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

}

