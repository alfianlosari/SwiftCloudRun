import Swifter
import Dispatch
import Foundation

let dateFormatter = DateFormatter()
dateFormatter.locale = Locale(identifier: "en_US")
dateFormatter.dateStyle = .full
dateFormatter.timeStyle = .full

let server = HttpServer()
server["/html"] = { req -> HttpResponse in
    return .ok(.html("""
        <h1>Swift Hello World from Google Cloud Run Serverless</h1>
        <p>Current time is \(dateFormatter.string(from: Date()))</p>
    """))
}

server["/api"] = { req -> HttpResponse in
    return .ok(.json([
        "result": """
        Swift Hello World from Google Cloud Run Serverless\n
        Current time is \(dateFormatter.string(from: Date()))
        """
        ] as AnyObject))
}

let semaphore = DispatchSemaphore(value: 0)
do {
    let port: Int = Int(ProcessInfo.processInfo.environment["PORT"] ?? "8080") ?? 8080
    
    try server.start(UInt16(port))
    print("Server has started ( port = \(try server.port()) ). Try to connect now...")
    semaphore.wait()
} catch {
    print("Server start error: \(error)")
    semaphore.signal()
}
