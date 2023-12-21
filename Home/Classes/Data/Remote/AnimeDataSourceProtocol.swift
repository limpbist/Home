//
//  AnimeDataSourceProtocol.swift
//  Home
//
//  Created by Aaron Andres Gaspar Peña on 24/11/23.
//

import CoreEntities

protocol AnimeDataSourceProtocol {
    //func list(parameters:AnimeRequestParameters, completion: @escaping (Result<AnimesResponseDTO, Error>) -> Void)
    func list(topic: String, startDate: String, endDate: String, completion: @escaping (Result<AnimesResponseDTO, Error>) -> Void)
}
