import Foundation

class UpdateService: UpdateServiceProtocol {
    
    private struct Constants {

        static let responseURL = "https://eu-west-1.aws.data.mongodb-api.com/app/chatreward-kytrn/endpoint/hello"
    }
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchData() async -> Result<ResponseData, NetworkError> {
        guard let url = URL(string: Constants.responseURL) else {
            return .failure(.invalidResopnse)
        }
        return await networkService.fetchData(from: url)
    }
}
