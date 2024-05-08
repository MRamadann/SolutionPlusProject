//
//  LoginUiTests.swift
//  SolutionPlusProjectTests
//
//  Created by Apple on 08/05/2024.
//

import XCTest

class LoginViewControllerUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testLoginWithValidCredentials() {
        // Tap on the username text field and enter a valid username
        let usernameTextField = app.textFields["usernameTextField"]
        usernameTextField.tap()
        usernameTextField.typeText("testuser")

        // Tap on the password text field and enter a valid password
        let passwordTextField = app.secureTextFields["passwordTextField"]
        passwordTextField.tap()
        passwordTextField.typeText("testpassword")

        // Tap on the login button
        let loginButton = app.buttons["loginButton"]
        loginButton.tap()

        // Assert that the login was successful (You can replace this assertion with whatever you expect to happen after successful login)
        XCTAssert(app.otherElements["homeScreen"].exists)
    }

    func testLoginWithEmptyFields() {
        // Tap on the login button without entering any credentials
        let loginButton = app.buttons["loginButton"]
        loginButton.tap()

        // Assert that an error message is displayed or some other appropriate behavior occurs (You can replace this assertion with whatever you expect to happen when login fields are empty)
        XCTAssert(app.alerts["Invalid Input"].exists)
    }
}
