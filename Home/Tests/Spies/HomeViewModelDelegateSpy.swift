@testable import Home
@testable import CoreBootcamp

class HomeViewModelDelegateSpy: HomeViewModelDelegateProtocol {
    public var currentState: ViewControllerState?
    func homeEvent(state: ViewControllerState) {
        currentState = state
    }
}
