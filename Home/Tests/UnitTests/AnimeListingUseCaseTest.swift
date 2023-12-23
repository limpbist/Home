//
//  AnimeListingUseCaseTest.swift
//  Home-Unit-UnitTests
//
//  Created by Aaron Andres Gaspar Peña on 28/11/23.
//

import XCTest

@testable import Home

class AnimeListingUseCaseUnitTest: XCTestCase {
    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testRepositoryListing() {
        let exp = expectation(description: "the use case calls the repository")
        var success: Bool = false
        
        let dataSource = AnimeMockDataSource()
        let repository = RemoteAnimeRepository(dataSource: dataSource)
        let useCase = AnimeListingUseCase(animeRepository: repository)
        
        useCase.execute(
            topic: "naruto",
            startDate: "2002-01-01",
            endDate: "2010-01-01",
            completion: {
                result in
                switch result {
                case .success(let domainBooksArray):
                    print(domainBooksArray)
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

