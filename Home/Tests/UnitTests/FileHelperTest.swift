//
//  FileHelperTest.swift
//  Home-Unit-UnitTests
//
//  Created by Aaron Andres Gaspar Peña on 10/12/23.
//

import XCTest

@testable import Home

class FileHelperTests: XCTestCase {
    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testClearCache() {
        let empty = FileHelper.clearCoversCache()
        XCTAssertTrue(empty)
    }
}
