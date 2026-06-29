import Foundation

struct Book: Codable {
    let title: String
    let authorName: [String]?
    let firstPublishYear: Int?
    let coverI: Int?
    let key: String

    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case authorName = "author_name"
        case firstPublishYear = "first_publish_year"
        case coverI = "cover_i"
        case key = "key"
    }
}
struct BookSearchResponse: Codable {
    let results: [Book]

    private enum CodingKeys: String, CodingKey {
        case results = "docs"
    }
}
extension Book: ConvertibleToCollectionItem {
    func toCollectionItem(collectionID: UUID) async throws -> CollectionItem {
        guard let validCover = coverI else {
             return CollectionItem(
            collectionID: collectionID, id: UUID(), name: self.title, dateOfCreation: .now, note: "",
            photo: nil, category: .books)
        }
        guard let imageURL = URL(string: "https://covers.openlibrary.org/b/id/\(validCover)-M.jpg") else {
            throw NetworkingError.invalidURL
        }
        let imageData: Data? = try await APIClient.shared.get(url: imageURL)

        return CollectionItem(
            collectionID: collectionID, id: UUID(), name: self.title, dateOfCreation: .now, note: "",
            photo: imageData, category: .books)
    }
}