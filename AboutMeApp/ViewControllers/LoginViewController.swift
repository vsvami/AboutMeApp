//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Vladimir Dmitriev on 10.02.24.
//

import UIKit

final class LoginViewController: UIViewController {

    // MARK: - IB Outlets
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    // MARK: - Private Properties
    
    private let user = User.getUser()
    
    // MARK: - Overrides Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTF.text == user.userName, passwordTF.text == user.password else {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login and password") {
                    self.passwordTF.text = ""
                }
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? UITabBarController
        
        welcomeVC?.viewControllers?.forEach { viewController in
            if let homeVC = viewController as? WelcomeViewController {
                homeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                navigationVC.title = user.person.fullName
                
                let personVC = navigationVC.topViewController as? PersonViewController
                personVC?.user = user
            }
        }
    }
    
    // MARK: - IB Actions
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(withTitle: "Oops!", andMessage: "Your name is \(user.userName) 😉")
        : showAlert(withTitle: "Oops!", andMessage: "Your password is \(user.password) 😉")
    }
    
    // MARK: - Private Methods
    
    private func showAlert(
        withTitle title: String,
        andMessage message: String,
        complition: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in 
            complition?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

