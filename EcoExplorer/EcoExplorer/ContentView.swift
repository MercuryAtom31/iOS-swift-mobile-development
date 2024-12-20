import SwiftUI

struct ContentView: View {
    @ObservedObject var ecosystems = Ecosystems() // Initialize Ecosystems Data Manager
    @State private var searchText = "" // Search text state
    @State private var sortByName = false // Sort toggle state

    var filteredEcosystems: [Ecosystem] {
        // If searchText is empty, show all ecosystems
        let results = searchText.isEmpty ? ecosystems.ecosystems : ecosystems.search(query: searchText)
        return sortByName ? results.sorted { $0.name < $1.name } : results
    }

    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                TextField("Search ecosystems", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                // Sort Toggle
                Toggle("Sort by Name", isOn: $sortByName)
                    .padding()
                
                // List of Ecosystems
                List(filteredEcosystems) { ecosystem in
                    NavigationLink(destination: EcosystemDetail(ecosystem: ecosystem)) {
                        Text(ecosystem.name)
                    }
                }
                .navigationBarTitle("EcoExplorer")
            }
        }
    }
}
