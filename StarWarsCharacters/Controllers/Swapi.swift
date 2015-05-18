//
//  swapi.swift
//  StarWarsCharacters
//
//  Created by Fernando on 5/15/15.
//  Copyright (c) 2015 F3rn4nd0. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreData
import JSQCoreDataKit

class Swapi {

    let urlApi = "https://swapi.co/api"
    let character = "people"
    let countCharacters = 86
    let context : NSManagedObjectContext
    
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getCharacter(#id: Int,completion:(json: JSON, error: NSError?) -> Void) {
        if let url = NSURL(string:"\(urlApi)/\(character)/\(id)/") {
            loadDataFromURL(url: url, completion: { (data, error) -> Void in
                if let errorData = error {
                    completion(json: JSON.nullJSON, error: error)
                    return
                }
                if let urlData = data {
                    completion(json: JSON(data: urlData), error: error)
                    return
                }
            })
        }
    }
    
    func loadDataFromURL(#url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        var session = NSURLSession.sharedSession()
        let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            if let responseError = error {
                completion(data: nil, error: responseError)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    var statusError = NSError(domain:"com.f3rn4nd0.StarWarsCharactes.Swapi", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(data: nil, error: statusError)
                } else {
                    completion(data: data, error: nil)
                }
            }
        })
        loadDataTask.resume()
    }
    
    func downloadAllCharacters() {
        for index in 1...100 {
            getCharacter(id: index, completion: { (json, error) -> Void in
                if json == JSON.nullJSON {
                    return
                }
                let birthYear = json["birth_year"].stringValue
                let created = NSDate.dateFromISOString(json["created"].stringValue)
                let edited = NSDate.dateFromISOString(json["edited"].stringValue)
                let eyeColor = json["eye_color"].stringValue
                let gender = json["gender"].stringValue
                let hairColor = json["hair_color"].stringValue
                let height = json["height"].doubleValue
                let mass = json["mass"].doubleValue
                let name = json["name"].stringValue
                let skinColor = json["skin_color"].stringValue
                let url = json["url"].stringValue
                if let oldCharacter = Character.getForUrl(url, context: self.context) {
                    oldCharacter.update(skinColor, name: name, mass: mass, height: height, hairColor: hairColor, gender: gender, eyeColor: eyeColor, edited: edited, created: created, birthYear: birthYear)
                    let result: ContextSaveResult = saveContextAndWait(self.context)
                    if !result.success {
                        println("Save error: \(result.error)")
                    }
                    return
                }
                let newCharacter = Character(context: self.context, url: url, skinColor: skinColor, name: name, mass: mass, height: height, hairColor: hairColor, gender: gender, eyeColor: eyeColor, edited: edited, created: created, birthYear: birthYear)
                self.loadDefaultImage(newCharacter, index: index)
                let result: ContextSaveResult = saveContextAndWait(self.context)
                if !result.success {
                    println("Save error: \(result.error)")
                }
                
            })
        }
    }
    
    func loadDefaultImage(character : Character, index: Int) {
        switch(index) {
        case 2:
            character.loadImage(UIImage(named: "c3po.jpg"))
        case 3:
            character.loadImage(UIImage(named: "R2-D2.jpg"))
        case 4:
            character.loadImage(UIImage(named: "darthVader.jpg"))
        case 13:
            character.loadImage(UIImage(named: "chewbacca.jpg"))
        case 20:
            character.loadImage(UIImage(named: "yoda.jpg"))
        case 21:
            character.loadImage(UIImage(named: "palpatine.jpg"))
        default: ()
        }
    }
    
}

