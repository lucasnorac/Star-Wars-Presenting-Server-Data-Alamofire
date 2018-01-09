//
//  Person.swift
//  Star Wars Presenting Server Data Alamofire
//
//  Created by Lucas Caron Albarello on 30/12/2017.
//  Copyright © 2017 Lucas Caron Albarello. All rights reserved.
//

import Foundation

struct Person {
    let birthYear : String
    let eyeColor : String
    let gender : String
    let hairColor : String
    let height : String
    private let homeWorldLink : String
    let mass : String
    let name : String
    let skinColor : String
    init?(json : JSON) {
        guard let birthYear = json["birth_year"] as? String,
        let eyeColor = json["eye_color"] as? String,
        let gender = json["gender"] as? String,
        let hairColor = json["hair_color"] as? String,
        let height = json["height"] as? String,
        let homeWorldLink  = json["homeworld"] as? String,
        let mass = json["mass"] as? String,
        let name = json["name"] as? String,
        let skinColor = json["skin_color"] as? String
            else {return nil}
        self.birthYear = birthYear
        self.eyeColor = eyeColor
        self.gender = gender
        self.hairColor = hairColor
        self.height = height
        self.homeWorldLink = homeWorldLink
        self.mass = mass
        self.name = name
        self.skinColor = skinColor
    }
    func homeworld(_ completion: @escaping (String)-> Void){
        NetworkingServices.shared.getHomeWorld(homeworldLink: homeWorldLink) { (homeworld) in
            completion(homeworld)
        }
    }
}
