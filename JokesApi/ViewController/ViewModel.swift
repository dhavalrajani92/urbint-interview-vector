//
//  ViewModel.swift
//  JokesApi
//
//  Created by Dhaval Rajani on 11/27/23.
//

final class ViewModel {
  private let data: Joke
  init(data: Joke) {
    self.data = data
  }

  var value: String {
    data.value
  }
}
