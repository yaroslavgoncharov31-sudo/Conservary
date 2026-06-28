import Foundation

struct OpenLibraryProvider: SearchProvider {

    typealias Reply = Book

    func buildURL(query: String) throws -> URL {
        guard
            let url = URL(string: "https://openlibrary.org/search.json?q=\(query)")
        else {
            throw NetworkingError.invalidURL
        }
        return url
    }


    func search(query: String) async throws -> [Book] {
        let url = try buildURL(query: query)
        let data = try await APIClient.shared.get(url: url)
        let result = try JSONDecoder().decode(BookSearchResponse.self, from: data).results
        if result.isEmpty {
            throw NetworkingError.noResults
        }
        return result
    }
}
