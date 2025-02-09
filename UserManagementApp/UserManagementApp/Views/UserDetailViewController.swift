//
//  UserDetailViewController.swift
//  UserManagementApp
//
//  Created by Yusuf Muhammet Yıldırım on 2/9/25.
//

import UIKit

/// Displays user details
final class UserDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private let user: AppUser
    
    // MARK: - Initializer
    
    init(user: AppUser) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.backgroundColor = .white
        title = user.name
        
        
        let nameLabel = createLabel(text: "Name: \(user.name)")
        let emailLabel = createLabel(text: "Email: \(user.email)")
        let phoneLabel = createLabel(text: "Phone: \(user.phone)")
        let websiteLabel = createLabel(text: "Website: \(user.website)")
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, emailLabel, phoneLabel, websiteLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

// MARK: - UI Helpers
private extension UserDetailViewController {
    
    func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }
}
