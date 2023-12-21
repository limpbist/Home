//
//  AnimeCoverDataSourceProtocol.swift
//  Home
//
//  Created by Aaron Andres Gaspar Peña on 5/12/23.
//

import Foundation

protocol AnimeCoverDataSourceProtocol {
    func getCover(animeOLID: String, completion: @escaping (Result<UIImage, Error>) -> Void)
}
