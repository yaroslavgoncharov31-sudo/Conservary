import Foundation

struct Release: Codable {
    let id: Int
    let title: String
    let year: String?
    let coverImage: String?
    let type: String?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case year = "year"
        case coverImage = "cover_image"
        case type = "type"
    }
}
struct ReleaseSearchResponse: Codable {
    let results: [Release]
}
extension Release: ConvertibleToCollectionItem {
    func toCollectionItem(collectionID: UUID) async throws -> CollectionItem {
        guard let validCoverImage = coverImage else {
            return CollectionItem(
            collectionID: collectionID, id: UUID(), name: self.title, dateOfCreation: .now, note: "",
            photo: nil, category: .vinyl)
        }
        guard let imageURL = URL(string: validCoverImage) else {
            throw NetworkingError.invalidURL
        }
        let imageData = try await APIClient.shared.get(url: imageURL)

        return CollectionItem(
            collectionID: collectionID, id: UUID(), name: self.title, dateOfCreation: .now, note: "",
            photo: imageData, category: .vinyl)
    }
}
