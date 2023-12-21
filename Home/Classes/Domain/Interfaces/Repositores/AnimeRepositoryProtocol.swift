import CoreEntities

protocol AnimeRepositoryProtocol {
    //func perfomListResquest(parameters: AnimeRequestParameters, completion:@escaping (Result<[Anime], Error>) -> Void) -> Void
    func perfomListResquest(topic: String, startDate: String, endDate: String, completion:@escaping (Result<[Anime], Error>) -> Void) -> Void
}
