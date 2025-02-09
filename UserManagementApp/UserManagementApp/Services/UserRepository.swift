//
//  UserRepository.swift
//  UserManagementApp
//
//  Created by Yusuf Muhammet Yıldırım on 2/9/25.
//

import Foundation

//MARK: Protocol for managing user data
protocol UserRepositoryProtocol {
    func getUsers(completion: @escaping (Result<[AppUser], NetworkError>) -> Void)
}

final class UserRepository: UserRepositoryProtocol {
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
    }

    func getUsers(completion: @escaping (Result<[AppUser], NetworkError>) -> Void) {
        networkManager.fetchUsers(completion: completion)
    }
}
