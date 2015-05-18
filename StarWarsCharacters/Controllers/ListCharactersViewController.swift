//
//  ListCharactersViewController.swift
//  StarWarsCharacters
//
//  Created by Fernando on 5/14/15.
//  Copyright (c) 2015 F3rn4nd0. All rights reserved.
//

import UIKit
import CoreData

class ListCharactersViewController: UIViewController, UITableViewDelegate ,UITableViewDataSource ,NSFetchedResultsControllerDelegate {
    
    
    var aFetchedResultsController : NSFetchedResultsController = NSFetchedResultsController()
    
    @IBOutlet weak var tableViewCharacters: UITableView!
    
    
    convenience init(fetchResultController: NSFetchedResultsController) {
        self.init(nibName: "ListCharactersViewController", bundle: nil)
        self.aFetchedResultsController = fetchResultController;
        self.aFetchedResultsController.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "List Start Wars Characters"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK:- Delegate UITableViewDelegate, UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let countSection = aFetchedResultsController.sections?.count {
            return countSection
        }
        return 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let countCharacters = aFetchedResultsController.sections?[section].numberOfObjects {
            return countCharacters
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("CharacterCell") as? UITableViewCell
        if(cell == nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CharacterCell")
        }
        
        if let currentCharacter = aFetchedResultsController.objectAtIndexPath(indexPath) as? Character {
            cell!.textLabel!.text = currentCharacter.name
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let sectionName = aFetchedResultsController.sections?[section].name {
            return sectionName;
        }
        return "";
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
        return aFetchedResultsController.sectionIndexTitles
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let currentCharacter = aFetchedResultsController.objectAtIndexPath(indexPath) as? Character {
           let viewCharacter = CharacterViewController(character: currentCharacter)
            self.navigationController?.pushViewController(viewCharacter, animated: true)
        }
    }
    
    //MARK:- Delegate NSFetchedResultsControllerDelegate
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        self.tableViewCharacters.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        switch(type) {
        case .Insert:
            self.tableViewCharacters.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
        case .Delete:
            self.tableViewCharacters.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
        default: ()
        }
    }
    
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch(type)
        {
        case .Insert:
            self.tableViewCharacters.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade)
        case .Delete:
            self.tableViewCharacters.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade);
        case .Update:
            self.tableViewCharacters.reloadRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade);
        case .Move:
            self.tableViewCharacters.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade);
            self.tableViewCharacters.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade);
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        self.tableViewCharacters.endUpdates()
    }
}
