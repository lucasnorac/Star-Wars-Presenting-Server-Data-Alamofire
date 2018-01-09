//
//  DetailsVC.swift
//  Star Wars Presenting Server Data Alamofire
//
//  Created by Lucas Caron Albarello on 30/12/2017.
//  Copyright © 2017 Lucas Caron Albarello. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var homeWorld: UILabel!
    @IBOutlet weak var birthYear: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var mass: UILabel!
    @IBOutlet weak var hairColor: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var skinColor: UILabel!
    @IBOutlet weak var colorEye: UILabel!
    var person : Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = person.name
        birthYear.text = person.birthYear
        height.text = person.height
        mass.text = person.mass
        hairColor.text = person.hairColor
        gender.text = person.gender
        skinColor.text = person.skinColor
        colorEye.text = person.eyeColor
        person.homeworld { (homeWorld) in
            self.homeWorld.text = homeWorld
        }
    }
}
