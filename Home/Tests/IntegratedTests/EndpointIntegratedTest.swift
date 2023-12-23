//
//  HomeBackendTest.swift
//  Home
//
//  Created by Jorge Murillo on 5/28/21.
//
import XCTest

@testable import Home

class AnimeBackendTest: XCTestCase {
    
    override func setUp() {
    }


    override class func tearDown() {
        
    }

    func testTaskEndpointCall() {
        let exp = expectation(description: "backend is returning data")
        var success: Bool = false
        
        AnimeTask.doRequest(topic: "naruto",
                            startDate: "2002-01-01",
                            endDate: "2010-01-01",
            completion: { result in
            print("result:\(result)")
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
    }
}

