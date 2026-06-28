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
