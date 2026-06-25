import Foundation 

struct PersistenceService {
    static let shared = PersistenceService()
    private init() {}

    func save<T: Storable>(repository: Repository<T>, filename: String) {
        let encoder = JSONEncoder()
        
        do {
            let data = try encoder.encode(repository.getAll())
            try data.write(to: URL(fileURLWithPath: filename))
        } catch {
            print("Something went wrong \(error.localizedDescription)")
        }
    }
    func load<T: Storable>(into repository: Repository<T>, filename: String) {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filename))
            let items = try decoder.decode([T].self, from: data)
            for item in items {
                repository.add(element: item)
            }
        } catch {
            print("Something went wrong \(error.localizedDescription)")
        }
    }
}