import Foundation
import CoreEntities

struct ConnectionParameters {
    /*static func getEndpoint(parameters: AnimeRequestParameters) -> String {
        return "https://api.jikan.moe/v4/anime?q=\(parameters.topic)&start_date=\(parameters.startDate)&end_date=\(parameters.endDate)"
    }*/
    static func getEndpoint(topic: String, startDate: String, endDate: String ) -> String {
        return "https://api.jikan.moe/v4/anime?q=\(topic)&start_date=\(startDate)&end_date=\(endDate)"
    }
}

class AnimeTask {
    //static func doRequest(parameters: AnimeRequestParameters, completion: @escaping (Result<AnimesResponseDTO, Error>) -> Void) -> Void
    static func doRequest(topic: String, startDate: String, endDate: String, completion: @escaping (Result<AnimesResponseDTO, Error>) -> Void) -> Void {
        
        //let url = URL(string: ConnectionParameters.getEndpoint(parameters: parameters))!
        let url = URL(string: ConnectionParameters.getEndpoint(topic: topic, startDate: startDate, endDate: endDate))!
        var request = URLRequest(url: url)

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                do {
                    let responseDTO = try JSONDecoder().decode(AnimesResponseDTO.self, from: data)
                    completion(.success(responseDTO))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
