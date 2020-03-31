import Foundation

public class Core {
    
    var fileManager: FileManager
    var envURL: URL? = nil
    
    init() {
        self.fileManager = FileManager.default
        self.envURL = checkFolder()
    }
    
    
    public func checkFolder() -> URL? {
        let docsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let envFolder = docsURL.appendingPathComponent("Envs")
        do {
            try fileManager.createDirectory(at: envFolder, withIntermediateDirectories: true, attributes: nil)
        } catch {
            return nil
        }
    
        return envFolder
    }
    
    public func checkFiles() -> [String?] {
        guard let folderURL = checkFolder() else { return [nil] }
        var filesPaths = Array<String?>()
        do {
            try filesPaths = fileManager.contentsOfDirectory(atPath: folderURL.path)
        } catch {
            filesPaths = [nil]
        }
        return filesPaths
    }
    
    public func createFile(content: String, fileName: String) {
        let fileURL = envURL?.appendingPathComponent("\(fileName).txt")
        do {
            try content.write(to: fileURL!, atomically: true, encoding: String.Encoding.utf8)
        } catch {
           print("Failed to create this environment.")
        }
    }
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
    public func deleteFile(fileName: String) {
        do{
            try fileManager.removeItem(at: (envURL?.appendingPathComponent("\(fileName).txt"))!)
        } catch{
            print("Failed to delete this file. It may been removed")
        }
    }
    
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
    
    public func openApp() {}
    
}
