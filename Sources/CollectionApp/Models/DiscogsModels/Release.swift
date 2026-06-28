import Foundation

struct Release: Codable {
    let id: Int
    let title: String?
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