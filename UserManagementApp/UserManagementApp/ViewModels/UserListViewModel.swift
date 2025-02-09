//
//  UserListViewModel.swift
//  UserManagementApp
//
//  Created by Yusuf Muhammet Yıldırım on 2/9/25.
//

import Foundation


/// Manages user list data
final class UserListViewModel {
    
    // MARK: - Properties
    
    private let repository: UserRepositoryProtocol
    private(set) var users: [AppUser] = []
    
    var onDataUpdated: (() -> Void)?
    var onError: ((String) -> Void)?
    
    // MARK: - Initializer
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    // MARK: - Fetch Users
    
    /// Fetches users from the API and updates the UI
    func fetchUsers() {
        repository.getUsers { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let users):
                    self?.users = users
                    self?.onDataUpdated?()
                case .failure(let error):
                    self?.onError?(error.localizedDescription)
                }
            }
        }
    }
}
