//
//  CoverTask.swift
//  Home
//
//  Created by Aaron Andres Gaspar Peña on 4/12/23.
//

import Foundation

struct ConnectionParametersCover {
    static func getEndPoint(olid: String) ->String {
        return "\(olid)"
    }
 }

class CoverTask {
    static func doRequest(olid: String, completion: @escaping (Result<UIImage, Error>) -> Void) -> Void {
        
        let url = URL(string: ConnectionParametersCover.getEndPoint(olid: olid))!
        var request = URLRequest(url: url)

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                try FileHelper.writeDataToImageFile(data: data, fileName: "\(olid)")
                let image = try FileHelper.readImageFromFile(fileName: "\(olid)")
                if let image = image {
                    DispatchQueue.main.async {
                        completion(.success(image))
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}

