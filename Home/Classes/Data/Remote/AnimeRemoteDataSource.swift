//
//  AnimeRemoteDataSource.swift
//  Home
//
//  Created by Aaron Andres Gaspar Peña on 24/11/23.
//

import CoreEntities

class AnimeRemoteDataSource: AnimeDataSourceProtocol {
    /*func list(parameters: CoreEntities.AnimeRequestParameters, completion: @escaping (Result<AnimesResponseDTO, Error>) -> Void) {
     HomeTask.doRequest(parameters: parameters, completion:completion)
     }*/
    func list(topic: String, startDate: String, endDate: String, completion: @escaping (Result<AnimesResponseDTO, Error>) -> Void) {
        AnimeTask.doRequest(topic: topic, startDate: startDate, endDate: endDate, completion:completion)
    }
}
