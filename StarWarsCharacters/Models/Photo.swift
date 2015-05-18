import CoreData
import JSQCoreDataKit

@objc(Photo)
class Photo: _Photo {

    convenience init(
        context: NSManagedObjectContext,
        image: UIImage?,
        character: Character
        ) {
            let entity = NSEntityDescription.entityForName(Photo.entityName(), inManagedObjectContext: context)!
            self.init(entity: entity, insertIntoManagedObjectContext: context)
            self.image = UIImageJPEGRepresentation(image, 1)
            self.character = character
    }
    
    
    func imageCharacter()-> UIImage? {
        if let imageCharacterData = self.image {
            return UIImage(data: imageCharacterData)
        }
        return nil
    }

}
