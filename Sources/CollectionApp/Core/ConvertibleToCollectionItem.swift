import Foundation
import FoundationNetworking

protocol ConvertibleToCollectionItem {
    func toCollectionItem(collectionID: UUID) async throws -> CollectionItem
} 