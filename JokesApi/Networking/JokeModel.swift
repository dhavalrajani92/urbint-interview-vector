//
//  File.swift
//  JokesApi
//
//  Created by Dhaval Rajani on 11/27/23.
//

import Foundation

struct Joke: Decodable {
  var iconUrl: String
  var id: String
  var url: String?
  var value: String

  enum CodingKeys: String, CodingKey {
    case iconUrl = "icon_url"
    case id = "id"
    case url = "url"
    case value = "value"
  }
}
