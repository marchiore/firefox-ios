import XCTest


class FirstRunTourTests: BaseTestCase {

    override func setUp() {
        launchArguments = [LaunchArguments.ClearProfile]
        super.setUp()
    }

    // Smoketest
    func testFirstRunTour() {
        // Complet the First run from first screen to the latest one
        // Check that the first's tour screen is shown as well as all the elements in there

        waitForExistence(app.staticTexts["Welcome to Firefox"])
        XCTAssertTrue(app.buttons.staticTexts["Next"].exists)
        XCTAssertTrue(app.buttons.staticTexts["Sign In"].exists)
        XCTAssertTrue(app.buttons.staticTexts["Sign Up"].exists)

        // Swipe to the second screen
        app.buttons.staticTexts["Next"].tap()
        XCTAssertTrue(app.buttons.staticTexts["Start Browsing"].exists)
        XCTAssertTrue(app.buttons.staticTexts["Sign In"].exists)
        XCTAssertTrue(app.buttons.staticTexts["Sign Up"].exists)
    }

    private func goToNextScreen() {
        app.buttons.staticTexts["Next"].tap()
    }

    private func tapStartBrowsingButton() {
        app.buttons.staticTexts["Start Browsing"].tap()
        // User starts in HomePanelScreen with the default Top Sites
        let topSites = app.collectionViews.cells["TopSitesCell"]
        waitForExistence(topSites)
    }
    
    func testStartBrowsingFromSecondScreen() {
        navigator.goto(FirstRun)
        goToNextScreen()
        tapStartBrowsingButton()
    }
    
    func testShowTourFromSettings() {
        goToNextScreen()
        tapStartBrowsingButton()
        navigator.goto(ShowTourInSettings)
        waitForExistence(app.staticTexts["Welcome to Firefox"])
    }
}
