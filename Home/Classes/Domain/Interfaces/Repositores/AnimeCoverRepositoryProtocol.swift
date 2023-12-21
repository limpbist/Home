//
//  AnimeCoverRepositoryProtocol.swift
//  Home
//
//  Created by Aaron Andres Gaspar Peña on 5/12/23.
//

import CoreEntities

protocol AnimeCoverRepositoryProtocol {
    func performCoverRequest(animeOLID: String, completion: @escaping (Result<UIImage, Error>) -> Void) -> Void
}
