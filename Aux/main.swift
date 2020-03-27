import Foundation

class Aux {
    let core: Core
    
    init() {
        self.core = Core()
    }
    
    public func input() -> String {
        var request: String = ""
        return request
    }
    
    public func output(responses: [String]) {
        for response in responses {
            print(response)
        }
    }
    
    public func process(arg: String) -> (Int, String) {
        var code: Int = 0
        var request: String = ""
        
        return (code, request)
    }
    
    public func execute(request: (code: Int, req: String)) {}
    
    public func createEnviroment(env: String) {}
    public func listEnviroment() {}
    public func executeEnviroment(env: String) {}
    public func deleteEnviroment(env: String) {}
}
