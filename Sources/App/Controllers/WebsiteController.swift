//
//  WebsiteController.swift
//  
//
//  Created by Connor Dean on 10/16/22.
//

import Vapor
import Leaf

struct WebsiteController: RouteCollection {

  func boot(routes: RoutesBuilder) throws {
    routes.get(use: indexHandler)
  }

  func indexHandler(_ req: Request) async throws -> View {
    let context = IndexContext(title: "Home page")
    return try await req.view.render("index", context)
  }
}

struct IndexContext: Encodable {
  let title: String
}
