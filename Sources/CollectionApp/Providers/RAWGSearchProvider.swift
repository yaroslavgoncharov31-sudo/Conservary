import Foundation

struct RAWGSearchProvider: SearchProvider {

    typealias Reply = Game

    func buildURL(query: String) throws -> URL {
        guard
            let url = URL(string: "https://api.rawg.io/api/games?key=\(rawgAPIKey)&search=\(query)")
        else {
            throw NetworkingError.invalidURL
        }
        return url
    }

    func search(query: String) async throws -> [Game] {
        let url = try buildURL(query: query)
        let data = try await APIClient.shared.get(url: url)
        let result = try JSONDecoder().decode(GameSearchResponse.self, from: data).results
        if result.isEmpty {
            throw NetworkingError.noResults
        }
        return result
    }
}
