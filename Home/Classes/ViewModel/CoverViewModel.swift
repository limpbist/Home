//
//  CoverViewModel.swift
//  Home
//
//  Created by Aaron Andres Gaspar Peña on 5/12/23.
//

import CoreBootcamp

protocol AnimeCoverViewModelDelegateProtocol: AnyObject {
    func coverEvent(state: ViewControllerState)
}

protocol AnimeDetailsViewModelDelegateProtocol: AnyObject {
    func detailsEvent(state: CoreBootcamp.ViewControllerState)
}

protocol CoverViewModelProtocol {
    var delegate: AnimeCoverViewModelDelegateProtocol? { get set }
    var coverImage: UIImage? {get set}
    func getCover(animeOLID: String)
}

final class CoverViewModel: CoverViewModelProtocol {
    var delegate: AnimeCoverViewModelDelegateProtocol?
    var coverImage: UIImage?
    var useCase: GetAnimeCoverUseCaseProtocol

    init(useCase: GetAnimeCoverUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func getCover(animeOLID: String) {
        print("bookOLID: \(animeOLID)")
        delegate?.coverEvent(state: .loading)
        useCase.execute(
            bookOLID: animeOLID,
            completion: { [weak self] result in
                switch result {
                case .success(let coverImage):
                    self?.coverImage = coverImage
                    self?.delegate?.coverEvent(state: .success)
                case .failure(let error):
                    print(error.localizedDescription)
                    self?.delegate?.coverEvent(state: .error)
                }
            })
    }
    
}
