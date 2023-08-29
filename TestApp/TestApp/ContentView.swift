import SwiftUI

struct ContentView: View {
    
    let updateService = MockUpdateService()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .task {
            let res = await updateService.fetchData()
            print("Res \(res)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
