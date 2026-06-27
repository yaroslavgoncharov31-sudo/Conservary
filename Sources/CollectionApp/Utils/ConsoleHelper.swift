struct ConsoleHelper {
    static func readQuery() -> String? {
        guard let input = readLine(), !input.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        else {
            print("Invalid input.")
            return nil
        }
        return input
    }
}