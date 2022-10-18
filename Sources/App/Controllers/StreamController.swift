//
//  StreamController.swift
//  
//
//  Created by Connor Dean on 10/16/22.
//

import Vapor
import Leaf

struct StreamController: RouteCollection {

  func boot(routes: RoutesBuilder) throws {
    routes.get(use: streamRenderer)
  }

  func streamRenderer(req: Request) async throws -> View {
    guard let manifest = req.parameters.get("manifestName") else {
        throw Abort(.notFound)
    }
      
    let context = StreamContext(manifestName: manifest)
                                           
    return try await req.view.render("index", context)
  }
}
