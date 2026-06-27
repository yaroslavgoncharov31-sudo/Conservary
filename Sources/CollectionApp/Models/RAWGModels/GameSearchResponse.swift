import Foundation 

struct Game: Codable {
    let id: Int
    let name: String 
    let released: String
    let backgroundImage: String

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
