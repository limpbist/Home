//
//  HomeViewModelTest.swift
//  Home-Unit-UnitTests
//
//  Created by Jorge Raul on 23/11/23.
//

import XCTest

@testable import Home

class HomeViewModelUnitTest: XCTestCase {
    override func setUp() {
    }

    override func tearDown() {
    }
    /*
    func testRequestList() {
        let dataSource = AnimeMockDataSource()
        let repository = RemoteAnimeRepository(dataSource: dataSource)
        let useCase = AnimeListingUseCase(animeRepository: repository)
        let viewModel = HomeViewModel(useCase: useCase)
        
        let viewModelSpy = HomeViewModelDelegateSpy()
        viewModel.delegate = viewModelSpy
        
        viewModel.requestList()
        
        XCTAssertNotNil(viewModel.books)
        XCTAssertEqual(viewModelSpy.currentState, .success)
    }*/
}
