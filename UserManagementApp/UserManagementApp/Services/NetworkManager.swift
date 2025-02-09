//
//  NetworkManager.swift
//  UserManagementApp
//
//  Created by Yusuf Muhammet Yıldırım on 2/9/25.
//

import Foundation

/// Network Manager for handling API requests
final class NetworkManager {
    
    /// Singleton instance
    static let shared = NetworkManager()
    
    /// Private initializer to prevent external instantiation
    private init() {}

    /// Fetches users from the API
    func fetchUsers(completion: @escaping (Result<[AppUser], NetworkError>) -> Void) {
        guard let url = API.Endpoint.users.url else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.requestFailed(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let users = try JSONDecoder().decode([AppUser].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }
        task.resume()
    }
}

/// Defines possible network errors
enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case noData
    case decodingError(Error)
}

/// Provides localized error messages
extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL. Please check the API address."
        case .requestFailed(let error):
            return "Request failed: \(error.localizedDescription)"
        case .noData:
            return "No data received from the server."
        case .decodingError(let error):
            return "Failed to decode data: \(error.localizedDescription)"
        }
    }
}
