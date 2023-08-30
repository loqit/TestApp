import Foundation

class MenuViewModel: MenuViewModelProtocol {
    
    // MARK: - Properties
    
    private let updateService: UpdateServiceProtocol
    @Published var data: ResponseData?
    @Published var isResponseSuccess = false
    
    init(updateService: UpdateServiceProtocol) {
        self.updateService = updateService
    }
    
    @MainActor
    func loadData() async {
        let result = await updateService.fetchData()
        switch result {
        case let .success(responseData):
            print("Response data \(responseData)")
            data = responseData
            isResponseSuccess = true
        case let .failure(error):
            print("Error: \(error)")
        }
    }
}
