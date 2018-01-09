//
//  NetworkingServices.swift
//  Star Wars Presenting Server Data Alamofire
//
//  Created by Lucas Caron Albarello on 30/12/2017.
//  Copyright © 2017 Lucas Caron Albarello. All rights reserved.
//

import Foundation
import Alamofire

typealias JSON = [String: Any]

class NetworkingServices{
    static let shared = NetworkingServices()
    private init(){}
    func getPeople(sucess sucessBlock: @escaping (GetPeopleResponse)-> Void){
        Alamofire.request("https://swapi.co/api/people/").responseJSON { (response) in
            guard let json = response.result.value as? JSON else {return}
            do{
                let getPeopleResponse = try GetPeopleResponse(json: json)
                sucessBlock(getPeopleResponse)
            } catch{}
            
        }
    }
    func getHomeWorld(homeworldLink: String, completion: @escaping(String)->Void){
        Alamofire.request(homeworldLink).responseJSON { (response) in
            guard let json = response.result.value as? JSON,
            let name = json["name"] as? String else {return}
            completion(name)
        }
    }
}
