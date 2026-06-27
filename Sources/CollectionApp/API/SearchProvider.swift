import Foundation

protocol SearchProvider {
    associatedtype Reply
    func search(query: String) async throws -> [Reply]
}
