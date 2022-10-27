//
//  FileSubmitController.swift
//  
//
//  Created by Connor Dean on 10/26/22.
//

import Vapor
import Leaf

struct FileSubmitController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        routes.get(use: fileSubmitRenderer)
    }
    
    func fileSubmitRenderer(req: Request) async throws -> View {
        return try await req.view.render("file-submit")
    }
}
