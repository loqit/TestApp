import Foundation

class MockUpdateService: UpdateServiceProtocol {
    
    func fetchData() async -> Result<ResponseData, NetworkError> {
        let mockData = ResponseData(data: ResponseModel(title: "Profile Completed", message: "Your profile looks great!"))
        return .success(mockData)
    }
}
