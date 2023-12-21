import CoreEntities
import CoreBootcamp

protocol HomeViewModelDelegateProtocol: class {
    func homeEvent(state: ViewControllerState)
}

protocol HomeViewModelProtocol {
    var delegate: HomeViewModelDelegateProtocol? { get set }
    var animes: [Anime]? {get set}
    var yearsRange: [String] {get set}
    //func requestList(parameters: AnimeRequestParameters)
    func requestList(topic: String, startDate: String, endDate: String)
}

final class HomeViewModel: HomeViewModelProtocol {
    var useCase: AnimeListingUseCase
    var animes: [Anime]?
    weak var delegate: HomeViewModelDelegateProtocol?
    lazy var yearsRange: [String] = {
        YearRangeCalculatorUseCase.getRange()
    }()
     
    init(useCase: AnimeListingUseCase) {
        self.useCase = useCase
    }
    
    func requestList(topic: String, startDate: String, endDate: String) {
        self.delegate?.homeEvent(state: .loading)
        useCase.execute(topic: topic, startDate: startDate, endDate: endDate, completion: { [weak self] result in
                            switch result {
                                case .success(let response):
                                    self?.animes = response
                                self?.delegate?.homeEvent(state: .success)
                                case .failure(let error):
                                    print(error.localizedDescription)
                                self?.delegate?.homeEvent(state: .error)
                            }
                        })
    }
}
