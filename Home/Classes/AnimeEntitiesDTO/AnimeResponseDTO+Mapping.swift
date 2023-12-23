import CoreEntities

 struct AnimesResponseDTO: Decodable {
     private enum CodingKeys: String, CodingKey {
         case pagination
         case dataAnime = "data"
     }
     let pagination: AnimesPaginationDTO
     let dataAnime: [AnimeDTO]
 }

 struct AnimesPaginationDTO: Decodable {
     private enum CodingKeys: String, CodingKey {
         case items
     }
     let items: AnimesItemsDTO
 }

 struct AnimesItemsDTO: Decodable {
     private enum CodingKeys: String, CodingKey {
         case count
     }
     let count: Int
 }

 struct AnimeDTO: Decodable {
     private enum CodingKeys: String, CodingKey {
         case mailId = "mal_id"
         case url
         case title
         case producers
         case aired
         case years = "year"
         case synopsis
         case images

     }
     let mailId: Int
     let url: String
     let title: String
     let producers:[Producer]
     let aired: Aired
     let years: Int?
     let synopsis: String
     let images: Images
 }

struct Images: Decodable {
    private enum CodingKeys: String, CodingKey {
        case jpg = "jpg"
    }
    let jpg: JpgUrls
}

struct JpgUrls: Decodable {
    private enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case smallImageUrl = "small_image_url"
        case largeImageUrl = "large_image_url"
    }
    let imageUrl: String
    let smallImageUrl: String
    let largeImageUrl: String
}

struct Producer: Decodable {
    private enum CodingKeys: String, CodingKey {
        case malId = "mal_id"
        case name
    }
    let malId: Int
    let name: String
}

struct Aired: Decodable {
    private enum CodingKeys: String, CodingKey {
        case stringYear = "string"
    }
    let stringYear:String
}

extension AnimeDTO {
    
    func toDomainAnime() -> Anime {
        var domainProducers: [CoreEntities.Producer] = []
        for producer in producers {
            let domainProducer = producer.toDomainProducer()
            domainProducers.append(domainProducer)
        }

        return .init(idAnime: mailId,
                     url: url,
                     title: title,
                     producers: domainProducers,
                     aired: aired.stringYear,
                     year: years ?? 0,
                     synopsis: synopsis,
                     imagesSmall: images.jpg.smallImageUrl,
                     imagesLarge: images.jpg.largeImageUrl )
    }
}

extension Producer {
    func toDomainProducer() -> CoreEntities.Producer {
        return .init(idProducer: malId, name: name)
    }
}
