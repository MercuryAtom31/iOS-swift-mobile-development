import Foundation

// Step 1: Ecosystems Data Manager class
class Ecosystems: ObservableObject {
    @Published var ecosystems: [Ecosystem] = []
    
    // Step 2: Load ecosystems data from JSON file
    init() {
        loadEcosystemData()
    }
    
    func loadEcosystemData() {
        if let url = Bundle.main.url(forResource: "ecosystems", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                self.ecosystems = try decoder.decode([Ecosystem].self, from: data)
                print("Ecosystems loaded successfully: \(self.ecosystems.count) items") // Debugging print
            } catch {
                print("Error loading data: \(error)") // Debugging print
            }
        } else {
            print("JSON file not found!") // Debugging print
        }
    }


    
    // Step 4: Search function
    func search(query: String) -> [Ecosystem] {
        return ecosystems.filter { $0.name.lowercased().contains(query.lowercased()) }
    }
    
    // Step 5: Sort function
    func sortByName() {
        ecosystems.sort { $0.name < $1.name }
    }
    
    // Step 6: Filter by ecosystem type
    func filterByType(_ type: String) -> [Ecosystem] {
        return ecosystems.filter { $0.type == type }
    }
}
