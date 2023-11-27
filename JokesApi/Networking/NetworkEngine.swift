//
//  NetworkEngine.swift
//  JokesApi
//
//  Created by Dhaval Rajani on 11/27/23.
//

import Foundation

protocol ApiProtocol {
  func request<T: Decodable>(endPoint: Endpoint, completion: @escaping (Result<T,Error>)-> ())
}

struct CustomError: Error {
  var error: String?
}

final class NetworkEngine: ApiProtocol {
  func request<T: Decodable>(endPoint: Endpoint, completion: @escaping (Result<T,Error>)-> ()) {
    var urlComponents = URLComponents()
    urlComponents.scheme = endPoint.scheme
    urlComponents.host = endPoint.baseUrl
    urlComponents.path = endPoint.path
    urlComponents.queryItems = endPoint.parameters

    guard let url = urlComponents.url else { return }
    let urlRequest = URLRequest(url: url)

    let session = URLSession(configuration: .default)
    let dataTask = session.dataTask(with: urlRequest) { data, responseData, error in
      guard (error == nil) else {
        completion(.failure(CustomError(error: "Something went wrong")))
        return
      }

      guard let statusCode = (responseData as? HTTPURLResponse)?.statusCode, statusCode >= 200, statusCode <= 299 else {
        completion(.failure(CustomError(error: "Something went wrong!!")))
        return
      }

      guard let data = data else {
        completion(.failure(CustomError(error: "Something went wrong!!")))
        return
      }

      do {
        let jsonData = try JSONDecoder().decode(T.self, from: data)
        completion(.success(jsonData))
      } catch let error {
        completion(.failure(CustomError(error: error.localizedDescription)))
      }
    }

    dataTask.resume()

  }
}
