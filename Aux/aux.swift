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
        let envURLs = core.readFile(fileName: env)
        for envURL in envURLs {
            if let url = envURL {
                core.openApp(appURL: url)
            }
        }
    }
    
    public func deleteEnvironment(env: String) {
        if env == "" {
            print("No one environmet was selected.")
            return
        }
        
        print("Are you sure about delete the \"\(env)\" environment? [y/n]", terminator: " ")
        if let confirm = readLine() {
            if confirm == "y" {
                core.deleteFile(fileName: env)
            }
        }
    }
}
