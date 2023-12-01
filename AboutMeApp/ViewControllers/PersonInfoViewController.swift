//
//  LargeTextViewController.swift
//  AboutMeApp
//
//  Created by Егор Аблогин on 30.11.2023.
//

import UIKit

class PersonInfoViewController: UITableViewController {
    
    var person: Person!

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return person.aboutPerson.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        var content = cell.defaultContentConfiguration()

        // Configure content.
        content.text = person.aboutPerson[indexPath.row].aboutCompany
        content.textProperties.alignment = .center
        content.textProperties.font = .boldSystemFont(ofSize: 18)
        content.secondaryText = person.aboutPerson[indexPath.row].technologies
        

        // Customize appearance.
        content.imageProperties.tintColor = .purple


        cell.contentConfiguration = content

        return cell
    }
}
