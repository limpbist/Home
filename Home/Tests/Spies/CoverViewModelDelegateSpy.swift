//
//  CoverViewModelDelegateSpy.swift
//  Home-Unit-UnitTests
//
//  Created by Aaron Andres Gaspar Peña on 5/12/23.
//

@testable import Home
@testable import CoreBootcamp
class CoverViewModelDelegateSpy: AnimeCoverViewModelDelegateProtocol {
    public var currentState: ViewControllerState?
    func coverEvent(state: CoreBootcamp.ViewControllerState) {
        currentState = state
    }
}
