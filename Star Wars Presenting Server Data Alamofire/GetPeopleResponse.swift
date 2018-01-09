//
//  GetPeopleResponse.swift
//  Star Wars Presenting Server Data Alamofire
//
//  Created by Lucas Caron Albarello on 30/12/2017.
//  Copyright © 2017 Lucas Caron Albarello. All rights reserved.
//

import Foundation
import Alamofire

struct GetPeopleResponse{
    let people : [Person]
    init(json: JSON) throws {
        guard let results = json["results"] as? [JSON] else {throw NetworkingError.badNetworkingStuff}
        let people = results.map{Person(json: $0)}.flatMap{$0}
        self.people = people
    }
}
