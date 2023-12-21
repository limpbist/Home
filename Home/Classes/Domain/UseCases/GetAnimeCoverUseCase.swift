//
//  GetAnimeCoverUseCase.swift
//  Home
//
//  Created by Aaron Andres Gaspar Peña on 5/12/23.
//

import Foundation
import CoreEntities

enum CoverError: Error {
    case noCoverIDInformation
}

protocol GetAnimeCoverUseCaseProtocol {
    func execute(bookOLID: String, completion: @escaping (Result<UIImage, Error>) -> Void)
}

final class GetAnimeCoverUseCase: GetAnimeCoverUseCaseProtocol {
    private var coversRepository: AnimeCoverRepositoryProtocol?

    init(coversRepository: AnimeCoverRepositoryProtocol) {
        self.coversRepository = coversRepository
    }
    init() {}
    
    func execute(
        bookOLID: String, completion: @escaping (Result<UIImage, Error>) -> Void
    ) {
        if bookOLID.isEmpty {
            completion(.failure(CoverError.noCoverIDInformation))
            return
        }
        if coversRepository == nil {
            var dataSource: AnimeCoverDataSourceProtocol
            if FileHelper.fileExistsInCache(animeOLID: bookOLID) {
                /// CacheDataSource
                print("cache:\(bookOLID)")
                dataSource = AnimeCoverCacheDataSource()
            } else {
                /// RemoteDataSource
                print("remote:\(bookOLID)")
                dataSource = AnimeCoverRemoteDataSource()
            }
            coversRepository = AnimeCoverRepository(dataSource: dataSource)
        }
        coversRepository?.performCoverRequest(
            animeOLID: bookOLID,
            completion: { result in
                completion(result)
            })
    }
}
