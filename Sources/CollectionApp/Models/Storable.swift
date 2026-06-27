import Foundation 

protocol Storable: Codable  {
    var id: UUID { get }
}