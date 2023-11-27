//
//  FlowViewmodel.swift
//  JokesApi
//
//  Created by Dhaval Rajani on 11/27/23.
//

import Foundation

final class FlowViewmodel {
  private let network: ApiProtocol
  private var data: Joke?
  init(network: ApiProtocol) {
    self.network = network

  }

  func fetchData(completion: @escaping ()->()) {
    network.request(endPoint: JokesAppEndpoint.getAllJokes) { (result: Result<Joke, Error>) in
      switch result {
      case .success(let data):
        self.data = data
        print(data)
        completion()
      case .failure:
        break
      }
    }
  }

  var viewModel: ViewModel? {
    guard let data = data else { return nil }
    return ViewModel(data: data)
  }

}
