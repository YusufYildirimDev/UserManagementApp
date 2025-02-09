//
//  MockUserRepository.swift
//  UserManagementAppTests
//
//  Created by Yusuf Muhammet Yıldırım on 2/9/25.
//

import Foundation
@testable import UserManagementApp

/// Mock repository for testing without real API calls
final class MockUserRepository: UserRepositoryProtocol {
    
    var shouldReturnError = false
    
    func getUsers(completion: @escaping (Result<[AppUser], NetworkError>) -> Void) {
        if shouldReturnError {
            completion(.failure(.noData))
        } else {
            let mockUsers = [
                AppUser(name: "John Doe", email: "john@example.com", phone: "123456789", website: "johndoe.com"),
                AppUser(name: "Jane Smith", email: "jane@example.com", phone: "987654321", website: "janesmith.com")
            ]
            completion(.success(mockUsers))
        }
    }
}
