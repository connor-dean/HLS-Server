import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    let streamController = StreamController()
    let fileSubmitController = FileSubmitController()
    
    try app.register(collection: streamController)
    try app.register(collection: fileSubmitController)

    app.get("") { req async throws -> View in
        return try await fileSubmitController.fileSubmitRenderer(req: req)
    }
    
    app.get("", ":manifestName") { req async throws -> View in
        return try await streamController.streamRenderer(req: req)
    }
}
