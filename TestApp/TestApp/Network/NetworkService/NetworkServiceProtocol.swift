import Foundation

protocol NetworkServiceProtocol {
    
    func fetchData<T: Decodable>(from url: URL) async -> Result<T, NetworkError>
}
