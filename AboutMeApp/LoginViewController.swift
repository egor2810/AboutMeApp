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
    
    @IBOutlet weak var stackView: UIStackView!
    
    
    let user = "1"
    let password = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logInButton.layer.cornerRadius = 5
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard userNameTF.text == user, passwordTF.text == password else {
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
        let greetingScreen = segue.destination as? GreetingScreenViewController
        
        greetingScreen?.userName = user
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    
    @IBAction func forgotUserDataButtonTapped(_ sender: UIButton) {
        if sender.tag == 0 {
            showAlert(withTitle: "Ooops!", andMessage: "Your name is \(user) 🥸")
        } else {
            showAlert(withTitle: "Ooops!", andMessage: "Your password is  \(password) 🥸")
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    private func showAlert (
        withTitle title: String,
        andMessage message: String,
        completion: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .cancel) {_ in
            completion?()
        }
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}

