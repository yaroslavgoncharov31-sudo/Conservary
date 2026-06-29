import Foundation

struct Game: Codable {
    let id: Int
    let name: String
    let released: String
    let backgroundImage: String?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case released = "released"
        case backgroundImage = "background_image"
    }
}
struct GameSearchResponse: Codable {
    let results: [Game]
}
extension Game: ConvertibleToCollectionItem {
    func toCollectionItem(collectionID: UUID) async throws -> CollectionItem {
        guard let validBackgroundImage = backgroundImage else {
            return CollectionItem(
            collectionID: collectionID, id: UUID(), name: self.name, dateOfCreation: .now, note: "",
            photo: nil, category: .games)
        }
        guard let imageURL = URL(string: self.backgroundImage) else {
            throw NetworkingError.invalidURL
        }
        let imageData = try await APIClient.shared.get(url: imageURL)

        return CollectionItem(
            collectionID: collectionID, id: UUID(), name: self.name, dateOfCreation: .now, note: "",
            photo: imageData, category: .games)
    }
}
