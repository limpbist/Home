//
//  CoverViewModelTest.swift
//  Home-Unit-UnitTests
//
//  Created by Aaron Andres Gaspar Peña on 5/12/23.
//

import XCTest

@testable import Home

class CoverViewModelTest: XCTestCase {
    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testRequestCover() {
        let dataSource = AnimeCoverMockDataSource()
        let repository = AnimeCoverRepository(dataSource: dataSource)
        let useCase = GetAnimeCoverUseCase(coversRepository: repository)
        let viewModel = CoverViewModel(useCase: useCase)
        
        let viewModelSpy = CoverViewModelDelegateSpy()
        viewModel.delegate = viewModelSpy
        
        let olid = "OL25565731M"
        
        viewModel.getCover(bookOLID: olid)
        
        XCTAssertNotNil(viewModel.coverImage)
        XCTAssertEqual(viewModelSpy.currentState, .success)
    }
}
