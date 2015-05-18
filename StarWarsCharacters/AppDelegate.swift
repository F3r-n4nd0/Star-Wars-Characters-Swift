//
//  AppDelegate.swift
//  StarWarsCharacters
//
//  Created by Fernando on 5/13/15.
//  Copyright (c) 2015 F3rn4nd0. All rights reserved.
//

import UIKit

import JSQCoreDataKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var stack: CoreDataStack?
    let modelName = "ModelStartWarsCharacters"
    let modelBundle = NSBundle(identifier:  "com.f3rn4nd0.StarWarsCharacters")
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.makeKeyAndVisible()
        
        let model = CoreDataModel(name: modelName, bundle: modelBundle!)
        stack = CoreDataStack(model: model)
        
        if let context = stack?.managedObjectContext {
            let swApi = Swapi(context: context)
            swApi.downloadAllCharacters()
        }
        
        
        if let context = stack?.managedObjectContext {
            let request = FetchRequest<Character>(entity: entity(name: Character.entityName(), context: context))
            request.sortDescriptors = [NSSortDescriptor(key: CharacterAttributes.name.rawValue, ascending: true)]
            
            let aFetchedResultsController = NSFetchedResultsController(
                fetchRequest: request,
                managedObjectContext: context,
                sectionNameKeyPath: "stringGroupByFirstInitial",
                cacheName: nil)
            
            aFetchedResultsController.performFetch(nil)
            let listCharacterViewController = ListCharactersViewController(fetchResultController: aFetchedResultsController)
            let navigationViewController = UINavigationController(rootViewController: listCharacterViewController);
            window?.rootViewController = navigationViewController
        }
        
   
        
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

