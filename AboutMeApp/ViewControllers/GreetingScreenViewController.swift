//
//  GreetingScreenViewController.swift
//  AboutMeApp
//
//  Created by Егор Аблогин on 24.11.2023.
//

import UIKit

final class GreetingScreenViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var myNameLabel: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    
    private let primaryColor = UIColor.systemPink
    private let secondaryColor = UIColor.purple
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradient(topColor: primaryColor, bottomColor: secondaryColor)
        logOutButton.layer.cornerRadius = 10
        
        greetingLabel.text = "Hello, \(user?.login ?? "1")"
        myNameLabel.text = "My name is \(user?.userInfo.name ?? "") \(user?.userInfo.surname ?? "")"
        
    }
    
}
