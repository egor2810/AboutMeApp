//
//  LargeTextViewController.swift
//  AboutMeApp
//
//  Created by Егор Аблогин on 30.11.2023.
//

import UIKit

final class PersonInfoViewController: UITableViewController {
    
    var person: Person!

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person.aboutPerson.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        var content = cell.defaultContentConfiguration()

        content.text = person.aboutPerson[indexPath.row].aboutCompany
        content.textProperties.alignment = .center
        content.textProperties.font = .boldSystemFont(ofSize: 18)
        content.secondaryText = person.aboutPerson[indexPath.row].technologies
        
        content.imageProperties.tintColor = .purple

        cell.contentConfiguration = content

        return cell
    }
}
