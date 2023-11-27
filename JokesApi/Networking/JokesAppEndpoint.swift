//
//  JokesAppEndpoint.swift
//  JokesApi
//
//  Created by Dhaval Rajani on 11/27/23.
//

import Foundation
enum JokesAppEndpoint: Endpoint {
  case getAllJokes

  var scheme: String {
    return "https"
  }

  var baseUrl: String {
    return "api.chucknorris.io"
  }

  var path: String {
    switch self {
    case .getAllJokes:
      return "jokes/random"
    }
  }

  var parameters: [URLQueryItem] {
    return []
  }

  var method: String {
    switch self {
    case .getAllJokes:
      return "GET"
    }
  }


}
