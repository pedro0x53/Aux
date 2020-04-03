import Foundation

class Aux {
    let core: Core
    
    init() {
        self.core = Core()
    }
    
    public func input() {
        while true{
            print("Aux $", terminator: " ")
            if let req = readLine(), !req.isEmpty {
                process(arg: req)
                print("\n")
            }
        }
    }
    
    public func process(arg: String) {
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
        case "help":
            help()
        case "exit":
            exit(0)
        default:
            print("Error: Command not recognized by the system.")
        }
    }
    
    public func help() {
        print("\nCOMMANDS\n\nlist: Displays all created environments.\ncreate _envName_: Try to crete a new environment.\nrun _envName_: Try to run an evironment.\ndelete _envName_: Delete an environment.\nexit: Terminate the application.\nhelp: Displays valid commands.\n\nYou must replace _envName_ with the name of the environment.\n\n")
    }
    
    public func createEnvironment(env: String) {
        let installedApps = core.listApps()
        
        var count = 0
        for app in installedApps {
            let appName = app.lastPathComponent
            let dotIndex = appName.lastIndex(of: ".") ?? appName.endIndex
            print(appName[..<dotIndex], terminator: "\t")
            count += 1
            if count == 6 {
                print("\n")
                count = 0
            }
        }
        
        print("\n\n\n\nEnter the applications you want to select separated by 2 space\nEx: Spotify  Safari  Pages\n\n")
        print("Aux $", terminator: " ")
        if let appList = readLine() {
            var chosenApps = appList.components(separatedBy: "  ")
            if chosenApps.count > 0 {
                chosenApps = chosenApps.map { return $0 + ".app" }
                var envApps = Array<String>()
                for installedApp in installedApps {
                    if chosenApps.contains(installedApp.lastPathComponent) {
                        envApps.append(installedApp.path)
                    }
                }
                core.createFile(content: envApps, fileName: env)
            }
        }
        return
    }
    
    public func listEnvironment() {
        let envs = core.checkFiles()
        if envs.count > 0 {
            for env in envs {
                print(env[env.startIndex..<(env.firstIndex(of: ".") ?? env.endIndex)], terminator: "\t")
            }
        } else {
            print("No enviroments was found.")
        }
        return
    }
    
    public func executeEnvironment(env: String) {
        let envURLs = core.readFile(fileName: env)
        for envURL in envURLs {
            if let url = envURL {
                core.openApp(appURL: url)
            }
        }
        return
    }
    
    public func deleteEnvironment(env: String) {
        if env.isEmpty || env == "" {
            print("No one environmet was selected.")
            return
        }
        
        print("Are you sure about delete the \"\(env)\" environment? [y/n]", terminator: " ")
        print("Aux $", terminator: " ")
        if let confirm = readLine() {
            if confirm == "y" {
                core.deleteFile(fileName: env)
            }
        }
        return
    }
}
