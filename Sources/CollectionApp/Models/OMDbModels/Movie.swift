import Foundation

struct Movie: Codable {
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String?

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

extension Movie: ConvertibleToCollectionItem {
    func toCollectionItem(collectionID: UUID) async throws -> CollectionItem {
        guard let validPoster = poster else {
            return CollectionItem(
            collectionID: collectionID, id: UUID(), name: self.title, dateOfCreation: .now, note: "",
            photo: nil, category: .films)
        }
        guard let imageURL = URL(string: validPoster) else {
            throw NetworkingError.invalidURL
        }
        let imageData = try await APIClient.shared.get(url: imageURL)

        return CollectionItem(
            collectionID: collectionID, id: UUID(), name: self.title, dateOfCreation: .now, note: "",
            photo: imageData, category: .films)
    }
}
