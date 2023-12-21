//
//  AnimeCoverMockDataSource.swift
//  Home-Unit-UnitTests
//
//  Created by Aaron Andres Gaspar Peña on 5/12/23.
//

import Foundation

@testable import Home

class AnimeCoverMockDataSource: BookCoverDataSourceProtocol {
    func imageWithColor(width: Int, height: Int) -> UIImage {
        let size = CGSize(width: width, height: height)
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            UIColor.green.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
    
    func getCover(bookOLID: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        let mockImage = imageWithColor(width: 50, height: 50)
        completion(.success(mockImage))
    }
}
