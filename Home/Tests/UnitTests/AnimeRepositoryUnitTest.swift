import XCTest

@testable import Home

class AnimeRepositoryUnitTest: XCTestCase {
    override func setUp() {
    }

    override func tearDown() {
    }
    
    /*
    func testRepositoryListing() {
        let exp = expectation(description: "backend is returning data and we can obtain domain entities")
        var success: Bool = false
        
        let dataSource = AnimeMockDataSource()
        let repository = RemoteAnimeRepository(dataSource: dataSource)
        
        repository.perfomListResquest(completion: { result in
            switch result {
            case .success(let domainBooksArray):
                print(domainBooksArray)
                success = true
            case .failure(let error):
                print(error)
                success = false
            }
            exp.fulfill()
        })

        waitForExpectations(timeout: 30) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(success, true)
        }
    }*/
}
