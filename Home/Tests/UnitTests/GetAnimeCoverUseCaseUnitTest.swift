//
//  GetAnimeCoverUseCaseUnitTest.swift
//  Home-Unit-UnitTests
//
//  Created by Aaron Andres Gaspar Peña on 5/12/23.
//

import XCTest

@testable import Home

class GetAnimeCoverUseCaseUnitTest: XCTestCase {
    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testExecuteGetCover() {
        let exp = expectation(description: "the use case calls the repository")
        var success: Bool = false
        
        let dataSource = AnimeCoverMockDataSource()
        let repository = AnimeCoverRepository(dataSource: dataSource)
        let useCase = GetAnimeCoverUseCase(coversRepository: repository)
        
        let olid = "OL25565731M"
        
        useCase.execute(
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
