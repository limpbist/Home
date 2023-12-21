//
//  AnimeCoverCacheDataSource.swift
//  Home
//
//  Created by Aaron Andres Gaspar Peña on 5/12/23.
//

import Foundation

class AnimeCoverCacheDataSource: AnimeCoverDataSourceProtocol {
    func getCover(animeOLID: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        
        do {
            let coverImage = try FileHelper.readImageFromFile(fileName: animeOLID)
            if let coverImage = coverImage {
                completion(.success(coverImage))
            }
        } catch {
            completion(.failure(error))
        }
    }
}
