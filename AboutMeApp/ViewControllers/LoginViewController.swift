//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Егор Аблогин on 23.11.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    private let primaryColor = UIColor.systemPink
    private let secondaryColor = UIColor.purple
    
    let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradient(topColor: primaryColor, bottomColor: secondaryColor)
        logInButton.layer.cornerRadius = 5
        fillAuthorizationFields()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    // MARK: - Segues funcs override
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard userNameTF.text == user.login, passwordTF.text == user.password else {
            showAlert(
                withTitle: "ERROR!!!",
                andMessage: "Incorrect login or password!!!"
            ) {
                self.passwordTF.text = ""
            }
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tabBarVC = segue.destination as? UITabBarController
        
        tabBarVC?.viewControllers?.forEach { viewController in
            if let navigationVC = viewController as? UINavigationController {
                if let finalScreen = navigationVC.topViewController as? GreetingScreenViewController {
                    finalScreen.user = user
                } else if let finalScreen = navigationVC.topViewController as? AboutMeViewController {
                    finalScreen.user = user
                }
            }
        }
    }
    
    // MARK: - other funcs
    
    private func fillAuthorizationFields() {
        userNameTF.text = user.login
        passwordTF.text = user.password
    }
    
    
    // MARK: - IBActions
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func autofillButtonTapped() {
        fillAuthorizationFields()
    }
    
    @IBAction func forgotUserDataButtonTapped(_ sender: UIButton) {
        if sender.tag == 0 {
            showAlert(withTitle: "Ooops!", andMessage: "Your name is \(user.login) 🥸")
        } else {
            showAlert(withTitle: "Ooops!", andMessage: "Your password is  \(user.password) 🥸")
        }
    }
    
}


