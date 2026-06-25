import Foundation 

struct AppRepositories: Sendable {
@MainActor static let collectionRepo = Repository<CollectionGroup>()
@MainActor static let itemRepo = Repository<CollectionItem>()
}