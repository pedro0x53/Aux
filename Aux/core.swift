import Foundation

public class Core {
    
    var fileManager: FileManager
    var folderURL: URL? = nil
    
    init() {
        self.fileManager = FileManager.default
        self.folderURL = checkFolder()
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
    
    public func createFile() {}
    public func readFile() {}
    public func deleteFile() {}
    
    public func listApps() {}
    public func openApp() {}
    
}
