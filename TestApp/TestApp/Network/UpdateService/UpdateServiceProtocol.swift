import Foundation

protocol UpdateServiceProtocol {
    
    func fetchData() async -> Result<ResponseData, NetworkError> 
}
