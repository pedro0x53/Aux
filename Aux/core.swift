import Foundation

public class Core {
    
    var fileManager: FileManager
    var envURL: URL? = nil
    
    init() {
        self.fileManager = FileManager.default
        self.envURL = checkFolder()
    }
    
    public func checkFolder() -> URL {
        let docsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let envFolder = docsURL.appendingPathComponent("Envs")
        
        var isDirectory: ObjCBool = false
        let folderExists = fileManager.fileExists(atPath: envFolder.path, isDirectory: &isDirectory)

        if !folderExists || !isDirectory.boolValue {
            do {
                try fileManager.createDirectory(at: envFolder, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Error: Unable to create directory.")
            }
        } else {
            print("Directory already exists")
        }
    
        return envFolder
    }
    
    public func checkFiles() -> [String] {
        let folderURL = checkFolder()
        var filesPaths = Array<String>()
        do {
            try filesPaths = fileManager.contentsOfDirectory(atPath: folderURL.path)
        } catch {
            filesPaths = [""]
        }
        return filesPaths
    }
    
    public func createFile() {}
    public func readFile(fileName: String) -> [URL?] {
        var appsURL: Array<URL?> = [nil]
        if let envURL = self.envURL {
            let fileURL = envURL.appendingPathComponent("\(fileName).txt")
            if fileManager.fileExists(atPath: fileURL.path) {
                do {
                    let content = try String(contentsOf: fileURL, encoding: .utf8).split(separator: "\n")
                    appsURL = content.map { URL(fileURLWithPath: String($0)) }
                } catch {
                    print("Unabe to read environment.")
                }
            } else {
                print("Non-existent environment.")
            }
        }
        return appsURL
    }
    public func deleteFile() {}
    
    public func listApps() -> [URL?]{
        var apps: Array<URL?> = [nil]
        let appsDir = fileManager.urls(for: .applicationDirectory, in: .systemDomainMask)[0]
        do {
            apps = try fileManager.contentsOfDirectory(at: appsDir, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
        } catch {
            print("No application found.")
        }
        return apps
    }
    
    public func openApp(appURL: URL) {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/usr/bin/open")
        task.arguments = ["\(appURL.path)"]
        do {
            try task.run()
        } catch {
            print("Error: Failed to run \"\(appURL.lastPathComponent)\"")
        }
    }
    
}
