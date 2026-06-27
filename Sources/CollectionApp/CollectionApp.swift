// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct CollectionApp {
    static func main() async throws {
        let answer = try await NetworkingService.searchGames(query: "Cyberpunk")
        answer.forEach({ Game in
        print(Game) })
      
    }
}
