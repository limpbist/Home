import Foundation
import CoreEntities

final class RemoteAnimeRepository: AnimeRepositoryProtocol {
    var dataSource: AnimeDataSourceProtocol
    
    init(dataSource: AnimeDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func perfomListResquest(topic: String, startDate: String, endDate: String, completion: @escaping (Result<[CoreEntities.Anime], Error>) -> Void) {
        dataSource.list(
            topic: topic,
            startDate: startDate,
            endDate: endDate,
            completion: { result in
                switch result {
                case.success(let animeResponseDTO):
                    var animeDomainArray: [Anime] = []
                    
                    for anime in animeResponseDTO.dataAnime{
                        let domainAnime = anime.toDomainAnime()
                        animeDomainArray.append(domainAnime)
                    }
                    completion(.success(animeDomainArray))
                    
                case.failure(let error):
                    completion(.failure(error))
                }
            }
        )
    }
}
