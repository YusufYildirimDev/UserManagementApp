//
//  UserManagementAppUITestsLaunchTests.swift
//  UserManagementAppUITests
//
//  Created by Yusuf Muhammet Yıldırım on 2/9/25.
//

import XCTest

final class UserManagementAppUITestsLaunchTests: XCTestCase {
    
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    /// Verifies that the application launches successfully and captures a screenshot
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        
        takeScreenshot(name: "LaunchScreen")
    }
    
    /// Captures a screenshot to facilitate debugging after tests
    private func takeScreenshot(name: String) {
        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}

