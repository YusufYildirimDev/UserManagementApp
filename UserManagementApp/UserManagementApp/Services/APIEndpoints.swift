//
//  APIEndpoints.swift
//  UserManagementApp
//
//  Created by Yusuf Muhammet Yıldırım on 2/9/25.
//

import Foundation

/// Manages API endpoints for network requests
struct API {
    
    private static let baseURL = "https://jsonplaceholder.typicode.com"
    
    enum Endpoint {
        case users
        
        var url: URL? {
            return URL(string: "\(API.baseURL)\(path)")
        }
        
        private var path: String {
            switch self {
            case .users:
                return "/users"
            }
        }
    }
}
