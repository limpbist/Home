//
//  AnimeDetailsViewModel.swift
//  Home
//
//  Created by Aaron Andres Gaspar Peña on 19/12/23.
//

import CoreEntities

protocol AnimeDetailsViewModelProtocol {
    var delegate: AnimeDetailsViewModelDelegateProtocol? { get set }
    var anime: Anime { get set }
}

final class AnimeDetailsViewModel: AnimeDetailsViewModelProtocol {
    var anime: Anime
    weak var delegate: AnimeDetailsViewModelDelegateProtocol?
    
    init(anime: Anime) {
        self.anime = anime
    }
    
    /*
    func getSynopsis(bookOLID: String) {
        print("bookOLID: \(bookOLID)")
        delegate?.detailsEvent(state: .loading)
        useCase.execute(
            bookOLID: bookOLID,
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
     
    }*/
}
