import Foundation

class Aux {
    let core: Core
    
    init() {
        self.core = Core()
    }
    
    public func input() {
        while let req = readLine() {
            process(arg: req)
        }
    }
    
    public func process(arg: String = "") {
        var args = arg.split(separator: " ")
        let cmd = args[0]
        args.remove(at: 0)
        let content = args.joined(separator: " ")
        
        switch cmd {
        case "list":
            listEnvironment()
        case "create":
            createEnvironment(env: content)
        case "run":
            executeEnvironment(env: content)
        case "delete":
            deleteEnvironment(env: content)
        case "exit":
            exit(0)
        default:
            print("Error: Command not recognized by the system.")
        }
        
    }
    
    public func createEnvironment(env: String) {
        print("Creating...")
    }
    
    public func listEnvironment() {
        print("Listing...")
    }
    
    public func executeEnvironment(env: String) {
            print("Running...")
    }
    
    public func deleteEnvironment(env: String) {
        print("Deleting...")
    }
}
