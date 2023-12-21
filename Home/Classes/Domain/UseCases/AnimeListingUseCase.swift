import Foundation
import CoreEntities

enum ListingError: Error {
    case emptyTopicRequest
}
protocol AnimeListingCaseProtocol {
    /*func execute(parameters: AnimeRequestParameters,
                 completion: @escaping (Result<[Anime], Error>) -> Void)*/
    func execute(topic: String,
                 startDate: String,
                 endDate: String,
                 completion: @escaping (Result<[Anime], Error>) -> Void)
}

final class AnimeListingUseCase: AnimeListingCaseProtocol {
    /*func execute(parameters: CoreEntities.AnimeRequestParameters, completion: @escaping (Result<[CoreEntities.Anime], Error>) -> Void) {
        if parameters.topic.isEmpty {
            completion(.failure(ListingError.emptyTopicRequest))
            return
        }
        animeRepository.perfomListResquest(parameters: parameters, completion: { result in
            completion(result)
        })
    }*/
    func execute(topic: String, startDate: String, endDate: String,
        completion: @escaping (Result<[Anime], Error>) -> Void
    ) {

        animeRepository.perfomListResquest(topic: topic, startDate: startDate, endDate: endDate,completion: { result in
            completion(result)
        })
    }
    private let animeRepository: AnimeRepositoryProtocol

    init(animeRepository: AnimeRepositoryProtocol) {
        self.animeRepository = animeRepository
    }
}
