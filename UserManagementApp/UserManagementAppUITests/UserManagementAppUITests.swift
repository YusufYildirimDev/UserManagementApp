//
//  UserManagementAppUITests.swift
//  UserManagementAppUITests
//
//  Created by Yusuf Muhammet Yıldırım on 2/9/25.
//

import XCTest

final class UserListUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    /// Verify that the User List screen is displayed
    func testUserListScreenIsDisplayed() {
        let userListTitle = app.navigationBars["Users"].exists
        XCTAssertTrue(userListTitle, "The User List screen should be displayed")
    }
    
    /// Ensure that user list items are visible
    func testUserListHasUsers() {
        let tableView = app.tables.firstMatch
        XCTAssertTrue(tableView.exists, "The table should be visible")
        XCTAssertGreaterThan(tableView.cells.count, 0, "The list should contain at least one user")
    }
    
    /// Test navigation to the User Detail screen
    func testUserDetailNavigation() {
        let firstCell = app.tables.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.exists, "There should be at least one cell in the list")
        
        firstCell.tap()
        
        let detailTitle = app.navigationBars.element(boundBy: 0).identifier
        XCTAssertNotEqual(detailTitle, "Users", "Navigation to the Detail screen should have occurred")
    }
}
