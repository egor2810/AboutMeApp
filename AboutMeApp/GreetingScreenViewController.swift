//
//  GreetingScreenViewController.swift
//  AboutMeApp
//
//  Created by Егор Аблогин on 24.11.2023.
//

import UIKit

final class GreetingScreenViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logOutButton.layer.cornerRadius = 10
        greetingLabel.text = "Hello, \(userName ?? "")"
    }
    
    
}
