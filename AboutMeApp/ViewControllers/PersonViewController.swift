//
//  PersonViewController.swift
//  AboutMeApp
//
//  Created by Vladimir Dmitriev on 14.02.24.
//

import UIKit

final class PersonViewController: UIViewController {

    // MARK: - IB Outlets
    
    @IBOutlet var gradientView: UIView!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var companyLabel: UILabel!
    @IBOutlet var departmentLabel: UILabel!
    @IBOutlet var positionLabel: UILabel!
    
    // MARK: - Public Properties
    
    var user: User!
    
    // MARK: - Overrides Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradient()
        
        navigationItem.title = user.person.fullName
        
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.image = UIImage(named: user.person.photo)
        
        firstNameLabel.text = user.person.firstName
        lastNameLabel.text = user.person.lastName
        companyLabel.text = user.person.company
        departmentLabel.text = user.person.department
        positionLabel.text = user.person.position
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let bioVC = segue.destination as? BioViewController
        bioVC?.user = user
    }
    
    // MARK: - Private Methods
    
    private func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.8463711143, green: 0.4714657664, blue: 0.5296775699, alpha: 1).cgColor, #colorLiteral(red: 0.4036064446, green: 0.5210264921, blue: 0.7680206895, alpha: 1).cgColor]
        gradientView.layer.addSublayer(gradientLayer)
    }
}
