import CoreData
import JSQCoreDataKit

@objc(Sound)
class Sound: _Sound {
    
    
    convenience init(
        context: NSManagedObjectContext,
        soundData: NSData?,
        character: Character
        ) {
            let entity = NSEntityDescription.entityForName(Sound.entityName(), inManagedObjectContext: context)!
            self.init(entity: entity, insertIntoManagedObjectContext: context)
            self.sound = soundData
            self.character = character
    }
}
