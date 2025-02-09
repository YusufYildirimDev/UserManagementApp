//
//  AppUser.swift
//  UserManagementApp
//
//  Created by Yusuf Muhammet Yıldırım on 2/9/25.
//

import Foundation

/// Represents a user model containing basic user information
struct AppUser: Codable, Identifiable, Equatable, Hashable {
    
    // MARK: - Properties
    
    let id = UUID()
        let name: String
        let email: String
        let phone: String
        let website: String
    
    // MARK: - CodingKeys
    
    private enum CodingKeys: String, CodingKey {
        case name, email, phone, website
    }
}
