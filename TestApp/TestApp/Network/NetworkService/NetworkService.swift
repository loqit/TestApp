import Foundation

class NetworkService: NetworkServiceProtocol {
    
    private var loadTask: Task<Data, Error>?
    
    func fetchData<T: Decodable>(from url: URL) async -> Result<T, NetworkError> {
        loadTask?.cancel()
        loadTask = Task {
            try await loadData(from: url)
        }
    
        guard let data = try? await loadTask?.value,
              let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            return .failure(.invalidData)
        }
        return .success(decodedData)
    }
    
    // MARK: - Private

    private func loadData(from url: URL) async throws -> Data {
        guard let (data, response) = try? await URLSession.shared.data(from: url) else {
            throw NetworkError.serverError
        }
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.invalidResopnse
        }
        return data
    }
}
