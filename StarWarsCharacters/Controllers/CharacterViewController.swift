//
//  CharacterViewController.swift
//  StarWarsCharacters
//
//  Created by Fernando on 5/17/15.
//  Copyright (c) 2015 F3rn4nd0. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {

    var character : Character?
    
    @IBOutlet weak var imageViewPhoto: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelHeight: UILabel!
    @IBOutlet weak var labelMass: UILabel!
    @IBOutlet weak var labelHairColor: UILabel!
    @IBOutlet weak var labelSkinColor: UILabel!
    @IBOutlet weak var labelEyeColor: UILabel!
    @IBOutlet weak var labelBirthYear: UILabel!
    @IBOutlet weak var labelGender: UILabel!
    
    convenience init(character: Character) {
        self.init(nibName: "CharacterViewController", bundle: nil)
        self.character = character
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCharacterData()
    }
    
    func loadCharacterData() {
        if let currentCharacter = character  {
            labelName.text = "Name: \(currentCharacter.name!)"
            labelHeight.text = "Height: \(currentCharacter.heightDescription())"
            labelMass.text = "Mass: \(currentCharacter.massDescription())"
            labelHairColor.text = "Hair Color: \(currentCharacter.hairColor!)"
            labelSkinColor.text = "Skin Color: \(currentCharacter.skinColor!)"
            labelEyeColor.text = "Eye Color: \(currentCharacter.eyeColor!)"
            labelBirthYear.text = "Birth Year: \(currentCharacter.birthYear!)"
            labelGender.text = "Gender: \(currentCharacter.gender!)"
            imageViewPhoto.image = currentCharacter.imageCharacter()
        }
    }
    
    @IBAction func actionSelectorPlaySound(sender: AnyObject) {
        
    }
    
}
