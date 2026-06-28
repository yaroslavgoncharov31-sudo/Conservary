import Foundation
import FoundationNetworking

final class APIClient: Sendable {
    static let shared = APIClient()

    private init() {}

    func get(url: URL) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
    func getRequest(request: URLRequest) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}
