import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    let streamController = StreamController()
    try app.register(collection: streamController)

    app.get("", ":manifestName") { req async throws -> View in
        return try await streamController.streamRenderer(req: req)
    }
}
