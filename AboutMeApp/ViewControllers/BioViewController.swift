//
//  BioViewController.swift
//  AboutMeApp
//
//  Created by Vladimir Dmitriev on 14.02.24.
//

import UIKit

final class BioViewController: UIViewController {

    // MARK: - IB Outlets
    
    @IBOutlet var gradientView: UIView!
    @IBOutlet var bioLabel: UILabel!
    
    var fullName: String!
    var bio: String!
    
    // MARK: - Overrides Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGradient()
        
        navigationItem.title = "\(fullName ?? "") Bio"
        
        bioLabel.text = bio
    }
    
    // MARK: - Private Methods
    
    private func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.8463711143, green: 0.4714657664, blue: 0.5296775699, alpha: 1).cgColor, #colorLiteral(red: 0.4036064446, green: 0.5210264921, blue: 0.7680206895, alpha: 1).cgColor]
        gradientView.layer.addSublayer(gradientLayer)
    }
}
