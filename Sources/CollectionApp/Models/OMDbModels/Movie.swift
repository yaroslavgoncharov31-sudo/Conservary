import Foundation

struct Movie: Codable {
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String

    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"

    }
}
struct MovieSearchResponse: Codable {
    let results: [Movie]
    let totalResults: String
    let response: String

    private enum CodingKeys: String, CodingKey {
        case results = "Search"
        case totalResults = "totalResults"
        case response = "Response"
    }
}
