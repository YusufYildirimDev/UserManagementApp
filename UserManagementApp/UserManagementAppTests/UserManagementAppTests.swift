//
//  UserManagementAppTests.swift
//  UserManagementAppTests
//
//  Created by Yusuf Muhammet Yıldırım on 2/9/25.
//

import XCTest
@testable import UserManagementApp

final class UserListViewModelTests: XCTestCase {
    
    var viewModel: UserListViewModel!
    var mockRepository: MockUserRepository!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockUserRepository()
        viewModel = UserListViewModel(repository: mockRepository)
    }
    
    override func tearDown() {
        viewModel = nil
        mockRepository = nil
        super.tearDown()
    }
    
    /// Tests whether the ViewModel correctly receives users when the API call is successful
    func testFetchUsers_Success() {
        let expectation = XCTestExpectation(description: "Users fetched successfully")
        
        viewModel.onDataUpdated = {
            expectation.fulfill()
        }
        
        viewModel.fetchUsers()
        
        wait(for: [expectation], timeout: 2.0)
        XCTAssertEqual(viewModel.users.count, 2, "Mock API 2 kullanıcı döndürmeli")
    }
    
    /// Tests whether the ViewModel displays an error message when the API call fails
    func testFetchUsers_Failure() {
        let expectation = XCTestExpectation(description: "Error returned due to no data")
        
        mockRepository.shouldReturnError = true
        viewModel.onError = { errorMessage in
            XCTAssertEqual(errorMessage, NetworkError.noData.localizedDescription)
            expectation.fulfill()
        }
        
        viewModel.fetchUsers()
        
        wait(for: [expectation], timeout: 2.0)
    }
}
