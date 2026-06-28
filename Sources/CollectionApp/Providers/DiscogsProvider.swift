import Foundation
import FoundationNetworking

struct DiscogsSearchProvider: SearchProvider {

    typealias Reply = Release

    func buildURL(query: String) throws -> URL {
        guard
            let url = URL(string: "https://api.discogs.com/database/search?q=\(query)&token=\(discogsAPIKey)&type=release")
        else {
            throw NetworkingError.invalidURL
        }
        return url
    }


 func search(query: String) async throws -> [Release] {
        let url = try buildURL(query: query)
        var request = URLRequest(url: url)
        request.setValue("Conservary/1.0", forHTTPHeaderField: "User-Agent")
        let data = try await APIClient.shared.getRequest(request: request)
        let result = try JSONDecoder().decode(ReleaseSearchResponse.self, from: data).results
        if result.isEmpty {
            throw NetworkingError.noResults
        }
        return result
    }
}
