import Testing
import Foundation
@testable import CollectionApp

@Test func addingNewCollection() async throws {
    let myCollection = CollectionGroup(id: UUID(), name: "My collection", dateOfCreation: .now)
    let myRepo = Repository<CollectionGroup>()
    myRepo.add(element: myCollection)
    #expect( myRepo.getAll().count == 1)
}
@Test func removingCollectionFromStorage() async throws {
    let ID = UUID()
    let collection2 = CollectionGroup(id: ID, name: "collection2", dateOfCreation: .now)
    let repo2 = Repository<CollectionGroup>()
    repo2.add(element: collection2)
    repo2.remove(id: ID)
    #expect(repo2.getAll().count == 0)
}
@Test func findingElementInStorage() async throws {
    let ID = UUID()
    let collection3 = CollectionGroup(id: ID, name: "collection2", dateOfCreation: .now)
    let repo3 = Repository<CollectionGroup>()
    repo3.add(element: collection3)
    guard let foundElement = repo3.find(id: ID) else { return }
    #expect(collection3.id == foundElement.id)
}