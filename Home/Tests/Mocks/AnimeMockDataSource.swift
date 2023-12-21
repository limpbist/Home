//
//  BooksRemoteDataSource.swift
//  Home
//
//  Created by Aaron Andres Gaspar Peña on 24/11/23.
//
//

@testable import Home

class AnimeMockDataSource: BooksDataSourceProtocol {
    
    func list(
        topic: String,
        startDate: String,
        endDate: String, 
        completion: @escaping (Result<AnimesResponseDTO, Error>) -> Void
    ) {
        do {
            let responseDTO = try JSONDecoder().decode(AnimesResponseDTO.self, from: Data(JSONDataProvider.animeDTOResponse.utf8))
            completion(.success(responseDTO))
        } catch {
            completion(.failure(error))
        }
    }
}
