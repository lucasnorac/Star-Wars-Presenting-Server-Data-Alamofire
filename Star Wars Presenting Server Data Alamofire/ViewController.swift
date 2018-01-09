//
//  ViewController.swift
//  Star Wars Presenting Server Data Alamofire
//
//  Created by Lucas Caron Albarello on 30/12/2017.
//  Copyright © 2017 Lucas Caron Albarello. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView : UITableView!

    var people = [Person]()
    
    @IBAction func onGetTapped(){
        print("Get")
        NetworkingServices.shared.getPeople { response in
        self.people = response.people
        self.tableView.reloadData()
        }
    }


}

extension ViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = people[indexPath.row].name
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "peopleToDetails",
        let details = segue.destination as? DetailsVC,
        let person = sender as AnyObject as? Person else {return}
        details.person = person
     }
}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "peopleToDetails", sender: people[indexPath.row])
    }
}
