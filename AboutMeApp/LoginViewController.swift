//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Vladimir Dmitriev on 10.02.24.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard userNameTF.text == "User", passwordTF.text == "11" else {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login and password",
                andCheck: true
            )
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? WelcomeViewController
        welcomeVC?.userName = userNameTF.text
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func forgotUserNameButtonTapped() {
        showAlert(
            withTitle: "Oops!",
            andMessage: "Your name is User 😉",
            andCheck: false
        )
    }
    
    @IBAction func forgotPasswordButtonTapped() {
        showAlert(
            withTitle: "Oops!",
            andMessage: "Your password is 11 😉",
            andCheck: false
        )
    }
    
    private func showAlert(
        withTitle title: String,
        andMessage message: String,
        andCheck check: Bool
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        if check {
            let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
                self.passwordTF.text = ""
            }
            alert.addAction(okAction)
        } else {
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
        }
        
        present(alert, animated: true)
    }
}

