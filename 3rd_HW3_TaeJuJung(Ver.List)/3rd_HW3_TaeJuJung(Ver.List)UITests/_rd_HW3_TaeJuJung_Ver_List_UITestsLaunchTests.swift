//
//  _rd_HW3_TaeJuJung_Ver_List_UITestsLaunchTests.swift
//  3rd_HW3_TaeJuJung(Ver.List)UITests
//
//  Created by 정태주 on 4/3/25.
//

import XCTest

final class _rd_HW3_TaeJuJung_Ver_List_UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
