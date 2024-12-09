//
//  APIManager.swift
//  СountryApp
//
//  Created by Данил Аникин on 08.12.2024.
//

import Foundation

class APIManager {
  private init() {}
  
  static let shared = APIManager()
  
  func getCountries(completion: @escaping (Result<[Country], Error>) -> Void) {
    let urlString: String = "https://restcountries.com/v3.1/all"
    
    guard let url = URL(string: urlString) else {
      completion(.failure(URLError(.badURL)))
      return
    }
    
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
      if error != nil {
        completion(.failure(error!))
      } else if let data = data {
        do {
          let decoder = JSONDecoder()
          let response = try decoder.decode([Country].self, from: data)
          completion(.success(response))
        } catch {
          print(error.localizedDescription)
          completion(.failure(error))
        }
      }
    })
    task.resume()
  }
}
