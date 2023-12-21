//
//  AnimeCoverRemoteDataSource.swift
//  Home
//
//  Created by Aaron Andres Gaspar Peña on 5/12/23.
//

import Foundation

class AnimeCoverRemoteDataSource: AnimeCoverDataSourceProtocol {
    func getCover(animeOLID: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        CoverTask.doRequest(olid: animeOLID, completion: completion)
    }
}
