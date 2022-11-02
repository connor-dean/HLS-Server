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
    
    // TODO move logic to controller
    // https://theswiftdev.com/file-upload-using-vapor-4/f
    app.post("upload") { req async throws -> String in
        // This looks like it works at least
        // See if we can save this file locally
        let fileInfo = try req.content.decode(Input.self)
        
        print("fileName: \(fileInfo.videoFile.filename)")
        
        return fileInfo.videoFile.filename
    }
    
    app.get("streams", ":manifestName") { req async throws -> View in
        return try await streamController.streamRenderer(req: req)
    }
}

// TODO move this and see if we can find a more appropriate location
struct Input: Content {
    let videoFile: File
}
