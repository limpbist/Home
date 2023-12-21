//
//  AnimeCoverRepository.swift
//  Home
//
//  Created by Aaron Andres Gaspar Peña on 5/12/23.
//

import Foundation
import CoreEntities

final class AnimeCoverRepository: AnimeCoverRepositoryProtocol {
    var dataSource: AnimeCoverDataSourceProtocol

    init(dataSource: AnimeCoverDataSourceProtocol) {
        self.dataSource = dataSource
    }
        
    func performCoverRequest(animeOLID: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        dataSource.getCover(
            animeOLID: animeOLID,
            completion: { result in
                switch result {
                case .success(let coverImage):
                    completion(.success(coverImage))
                case .failure(let error):
                    completion(.failure(error))
                }
            })
    }
}
