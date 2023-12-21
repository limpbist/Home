//
//  AnimeCoverRepositoryUnitTest.swift
//  Home-Unit-UnitTests
//
//  Created by Aaron Andres Gaspar Peña on 5/12/23.
//

import XCTest

@testable import Home

class BookCoverRepositoryUnitTest: XCTestCase {
    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testObtainCover() {
        let exp = expectation(description: "obtain image from mock")
        var success: Bool = false
        
        let dataSource = AnimeCoverMockDataSource()
        let repository = AnimeCoverRepository(dataSource: dataSource)
        
        let olid = "1"
        
        repository.performCoverRequest(
            bookOLID: olid,
            completion: { result in
                switch result {
                case .success(let coverImage):
                    XCTAssertNotNil(coverImage)
                    success = true
                case .failure(let error):
                    print(error)
                    success = false
                }
                exp.fulfill()
            }
        )
        
        waitForExpectations(timeout: 30) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(success, true)
        }
    }
}
