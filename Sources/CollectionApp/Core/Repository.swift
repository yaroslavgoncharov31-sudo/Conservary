import Foundation

final class Repository<T: Storable> {
    private var storage: [T] = []

    func add(element: T) {
        storage.append(element)
    }
    func remove(id: UUID) {
        guard let index = storage.firstIndex(where: { $0.id == id }) else {
            return
        }
        storage.remove(at: index)
    }
    func find(id: UUID) -> T? {
        return storage.first(where: { $0.id == id })
    }
    func getAll() -> [T] {
        return storage
    }
}
