//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Егор Аблогин on 23.11.2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logInButton.layer.cornerRadius = 5
    }

    
    @IBAction func forgotUserDataButtonTapped(_ sender: UIButton) {
        if sender.tag == 0 {
            showAlert(withTitle: "Ooops!", andMessage: "Your name is User 🥸")
        } else {
            showAlert(withTitle: "Ooops!", andMessage: "Your password is User🥸")
        }
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
}

