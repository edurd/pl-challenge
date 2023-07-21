//
//  ComicsContentViewTests.swift
//  platzy-challengeUITests
//
//  Created by Eduardo Hoyos Loli on 20/07/23.
//

import XCTest

final class ComicsContentViewTests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_didLoadComics_shouldLoadComics() throws {

        let navBarTitle = app.navigationBars["Comics"].staticTexts["Comics"]
        navBarTitle.tap()

        let firstButton = app.collectionViews.firstMatch.buttons.firstMatch
        XCTAssertTrue(firstButton.waitForExistence(timeout: 3))
    }

    func test_didTapFirstMatch_shouldRedirectToNextView() {

        let navBarTitle = app.navigationBars["Comics"].staticTexts["Comics"]
        navBarTitle.tap()

        let firstButton = app.collectionViews.firstMatch.buttons.firstMatch
        XCTAssertTrue(firstButton.waitForExistence(timeout: 3))
        firstButton.tap()

        let nextNavigationBar = app.navigationBars.firstMatch.staticTexts.firstMatch
        XCTAssertTrue(nextNavigationBar.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
