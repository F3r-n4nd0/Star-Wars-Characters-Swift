import CoreData
import JSQCoreDataKit

@objc(Character)
class Character: _Character {

    convenience init(
        context: NSManagedObjectContext,
        url: String,
        skinColor: String?,
        name: String?,
        mass: Double?,
        height: Double?,
        hairColor: String?,
        gender: String?,
        eyeColor: String?,
        edited: NSDate?,
        created: NSDate?,
        birthYear: String?) {
            
            let entity = NSEntityDescription.entityForName(Character.entityName(), inManagedObjectContext: context)!
            self.init(entity: entity, insertIntoManagedObjectContext: context)
            self.url = url
            self.skinColor = skinColor
            self.name = name
            if let newMass = mass {
                self.mass = NSDecimalNumber(double: newMass)
            }
            if let newHeight = mass {
                 self.height = NSDecimalNumber(double: newHeight)
            }
            self.hairColor = hairColor
            self.gender = gender
            self.eyeColor = eyeColor
            self.edited = edited
            self.created = created
            self.birthYear = birthYear
    }
    
    
    class func getForUrl(url: String, context: NSManagedObjectContext) -> Character? {
        let entity = NSEntityDescription.entityForName(Character.entityName(), inManagedObjectContext: context)!
        let request = FetchRequest<Character>(entity: entity)
        request.predicate = NSPredicate(format: "url = %@", url)
        let result = fetch(request: request, inContext: context)
        if result.success {
            return result.objects.first
        }
        println("Result characters save = \(result.error)");
        return nil;
    }
    
    func update (
        skinColor: String?,
        name: String?,
        mass: Double?,
        height: Double?,
        hairColor: String?,
        gender: String?,
        eyeColor: String?,
        edited: NSDate?,
        created: NSDate?,
        birthYear: String?) {
            self.skinColor = skinColor
            self.name = name
            if let newMass = mass {
                self.mass = NSDecimalNumber(double: newMass)
            }
            if let newHeight = height {
                self.height = NSDecimalNumber(double: newHeight)
            }
            self.hairColor = hairColor
            self.gender = gender
            self.eyeColor = eyeColor
            self.edited = edited
            self.created = created
            self.birthYear = birthYear        
    }
    
    func loadImage(image : UIImage?) {
        Photo(context: self.managedObjectContext!, image: image, character: self)
    }
    
    internal func stringGroupByFirstInitial() -> String {
        if let currentName = self.name {
            return String(currentName[currentName.startIndex])
        }
        return "Unknown"
    }
    
    
    func heightDescription() -> String {
        if let currentHeight = self.height {
            return "\(currentHeight)"
        }
        return "Unknown"
    }
    
    func massDescription() -> String {
        if let currentMass = self.mass {
            return "\(currentMass)"
        }
        return "Unknown"
    }
    
    func imageCharacter() -> UIImage? {
        if let currentImageCharacter = self.photo?.imageCharacter() {
            return currentImageCharacter
        }
        return nil
    }
    
}
