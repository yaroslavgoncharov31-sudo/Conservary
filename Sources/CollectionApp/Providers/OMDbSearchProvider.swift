import Foundation

struct OMDbSearchProvider: SearchProvider {

    typealias Reply = Movie

    func buildURL(query: String) throws -> URL {
        guard
            let url = URL(string: "https://www.omdbapi.com/?s=\(query)&apikey=\(omdbAPIKey)")
        else {
            throw NetworkingError.invalidURL
        }
        return url
    }


    func search(query: String) async throws -> [Movie] {
        let url = try buildURL(query: query)
        let data = try await APIClient.shared.get(url: url)
        let result = try JSONDecoder().decode(MovieSearchResponse.self, from: data).results
        if result.isEmpty {
            throw NetworkingError.noResults
        }
        return result
    }
}
