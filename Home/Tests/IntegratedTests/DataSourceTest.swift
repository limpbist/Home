//
//  HomeBackendTest.swift
//  Home
//
//  Created by Jorge Murillo on 5/28/21.
//
import XCTest

@testable import Home

class AnimeDataSourceTest: XCTestCase {
    override func setUp() {
    }

    override class func tearDown() {
    }

    /*
    func testDataSourceListing() {
        let exp = expectation(description: "backend is returning data")
        var success: Bool = false
        
        let dataSource = BooksRemoteDataSource()
        
        dataSource.list(completion: {
            result in
            switch result {
            case.success(let animeResponseDTO):
                print(animeResponseDTO)
                success = true
            case.failure(let error):
                print(error)
                success = false
            }
            
        })
        
        HomeTask.doRequest(completion: { result in
            switch result {
            case .success(let animeData):
                print(animeData)
                success = true
            case .failure(let error):
                print(error)
            }
            exp.fulfill()
        })
        
        waitForExpectations(timeout: 100) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(success, true)
        }
    }*/
}

