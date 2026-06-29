import Foundation

struct CollectionItem: Storable {
    var collectionID: UUID
    let id: UUID
    var name: String
    let dateOfCreation: Date
    var note: String
    var photo: Data? 
    let category: ItemCategory
}
