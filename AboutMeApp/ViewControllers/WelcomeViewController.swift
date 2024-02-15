//
//  WelcomeViewController.swift
//  AboutMeApp
//
//  Created by Vladimir Dmitriev on 11.02.24.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var gradientView: UIView!
    
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var fullNameLabel: UILabel!
    
    // MARK: - Public Properties
    
    var user: User!
    
    // MARK: - Overrides Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGradient()
        
        userNameLabel.text = "Welcome, \(user.userName)!"
        fullNameLabel.text = "My name is \(user.person.fullName)."
        
    }
    
    // MARK: - Private Methods
    
    private func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.8463711143, green: 0.4714657664, blue: 0.5296775699, alpha: 1).cgColor, #colorLiteral(red: 0.4036064446, green: 0.5210264921, blue: 0.7680206895, alpha: 1).cgColor]
        gradientView.layer.addSublayer(gradientLayer)
    }
}
